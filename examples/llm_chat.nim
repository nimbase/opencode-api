# opencode + chachachat — chat with project context
#
# Pulls the current project context from a running opencode server and feeds it
# to a chachachat conversation for LLM chat.
#
# Requires:
#   - a running opencode server:  opencode serve
#   - an LLM API key (OpenCode Zen / OpenAI-compatible):
#       export OPENCODE_ZEN_API_KEY=...
#
# Run:
#   nim r chachachat.nim "what is this project about?"
#
# Config via environment:
#   OPENCODE_BASE_URL     opencode server base URL (default: http://127.0.0.1:4096)
#   OPENCODE_API_KEY      bearer token for the opencode server (default: local)
#   OPENCODE_ZEN_API_KEY  API key used by chachachat for LLM requests
#   OPENCODE_LLM_MODEL    model to use (default: deepseek-v4-flash)

import opencode
import std/[asyncdispatch, os, strutils, strformat, options]
import chachachat

const
  DefaultBaseUrl = "http://127.0.0.1:4096"
  DefaultModel = "deepseek-v4-flash"

proc opencodeBaseUrl(): string =
  let url = getEnv("OPENCODE_BASE_URL", DefaultBaseUrl)
  result = if url.endsWith("/"): url else: url & "/"

proc apiKey(): string =
  getEnv("OPENCODE_API_KEY", "local")

proc zenKey(): string =
  getEnv("OPENCODE_ZEN_API_KEY", "")

proc streamChunk(chunk: ResponseChunk) =
  case chunk.chunkType
  of chunkReasoning:
    if chunk.text.len > 0:
      stdout.write("\e[2m", chunk.text, "\e[0m")
  of chunkContent:
    stdout.write(chunk.text)
  else:
    discard

proc buildContext(client: OpencodeClient): Future[string] {.async.} =
  ## Gather the current project state from the opencode server.
  var ctx = ""
  try:
    let project = await client.getProjectCurrent()
    ctx.add(fmt"Project: {project.id}\n")
    if project.name.isSome:
      ctx.add(fmt"Name:    {project.name.get}\n")
    let vcs = await client.getVcs()
    let branch = vcs.branch.get("")
    ctx.add(fmt"Branch:  {branch}\n")
    let status = await client.getVcsStatus()
    ctx.add("Changed files:\n")
    for f in status:
      ctx.add(fmt"  {f.status}  {f.file}\n")
  except CatchableError as e:
    ctx.add(fmt"(could not gather opencode context: {e.msg})\n")
  ctx

proc main(prompt: string) {.async.} =
  if zenKey().len == 0:
    echo "warning: OPENCODE_ZEN_API_KEY is not set; LLM requests will fail auth"
    echo ""

  let client = initOpencodeClient(apiKey())
  client.baseUri = opencodeBaseUrl()

  let context = await buildContext(client)

  let llm = newOpenCodeClient(
    apiKey = zenKey(),
    model = getEnv("OPENCODE_LLM_MODEL", DefaultModel)
  )

  let conv = newConversation(llm, responseCallback = streamChunk)
  conv.addMessage(UserMessageRole.system,
    "You are a helpful coding assistant. Here is context about the current " &
    "opencode project:\n\n" & context)
  conv.setTitle("opencode + chachachat")

  echo "You: ", prompt
  stdout.write("Assistant: ")
  try:
    let reply = await conv.sendMessage(prompt)
    echo ""
    echo ""
    echo "--- conversation history ---"
    for m in conv.getHistory():
      echo $m.role, ": ", m.content
  except CatchableError as e:
    echo ""
    echo "LLM request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "set OPENCODE_ZEN_API_KEY to chat with an LLM"

when isMainModule:
  let prompt = if paramCount() > 0:
    commandLineParams()[0]
  else:
    "Summarize this project in a few sentences."
  waitFor main(prompt)
