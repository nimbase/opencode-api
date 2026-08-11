# opencode client — end-to-end session chat example
#
# Creates a session, sends a prompt, polls until the assistant reply appears in
# the session context, and prints the resulting conversation.
#
# NOTE: the generated client does not export its request-body types (e.g.
# PostApiSessionRequest), so those calls use the client's exported httpPost
# helper with a raw JsonNode body instead.
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r session_chat.nim "your prompt"
#
# Config via environment:
#   OPENCODE_BASE_URL  server base URL (default: http://127.0.0.1:4096)
#   OPENCODE_API_KEY   bearer token sent with every request (default: local)

import opencode
import std/[asyncdispatch, os, strformat, strutils]

const
  DefaultBaseUrl = "http://127.0.0.1:4096"
  MaxPollSeconds = 60

proc baseUrl(): string =
  let url = getEnv("OPENCODE_BASE_URL", DefaultBaseUrl)
  result = if url.endsWith("/"): url else: url & "/"

proc apiKey(): string =
  getEnv("OPENCODE_API_KEY", "local")

proc printMessage(msg: JsonNode) =
  ## Render one projected session message.
  case msg["type"].getStr
  of "user", "system", "synthetic":
    echo "  user: ", msg["text"].getStr
  of "assistant":
    var text = ""
    for content in msg["content"]:
      if content["type"].getStr == "text":
        text.add(content["text"].getStr)
    echo "  assistant: ", text
  else:
    echo "  ", msg["type"].getStr, ": ", toJson(msg)

proc getContext(client: OpencodeClient, sessionID: string): Future[JsonNode] {.async.} =
  ## Fetch the raw context JSON. The typed getApiSessionSessionIDContext maps
  ## messages onto the empty SessionMessage variant, losing their fields.
  let res = await client.httpGet("/api/session/" & sessionID & "/context")
  result = fromJson(await res.body)

proc hasAssistantReply(ctx: JsonNode): bool =
  for msg in ctx["data"]:
    if msg["type"].getStr != "assistant":
      continue
    if not msg.hasKey("content"):
      continue
    for content in msg["content"]:
      if content["type"].getStr == "text" and content["text"].getStr.len > 0:
        return true

proc main(prompt: string) {.async.} =
  let client = initOpencodeClient(apiKey())
  client.baseUri = baseUrl()
  try:
    echo "POST /api/session"
    let created = await client.httpPost("/api/session", %*{"title": "nim example"})
    let session = toJsonNode(fromJson(await created.body, PostApiSessionResponse))
    let sessionID = session["data"]["id"].getStr
    echo "  created session: ", sessionID

    echo "POST /api/session/{id}/prompt"
    let prompted = await client.httpPost(
      fmt"/api/session/{sessionID}/prompt",
      %*{"prompt": %*{"text": prompt}}
    )
    echo "  HTTP ", prompted.code

    # The prompt is executed asynchronously, so poll the session context until
    # the assistant reply shows up.
    echo "waiting for the assistant reply..."
    var ctx = await client.getContext(sessionID)
    var waited = 0
    while not ctx.hasAssistantReply and waited < MaxPollSeconds:
      await sleepAsync(2000)
      ctx = await client.getContext(sessionID)
      waited += 2

    echo "GET /api/session/{id}/context (", ctx["data"].len, " messages)"
    for msg in ctx["data"]:
      printMessage(msg)
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  let prompt = if paramCount() > 0:
    commandLineParams()[0]
  else:
    "Say hello in one sentence."
  waitFor main(prompt)
