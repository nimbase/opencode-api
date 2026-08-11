# opencode client — catalog example (agents, models, providers, commands, skills, tools)
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r catalog.nim
#
# Config via environment:
#   OPENCODE_BASE_URL  server base URL (default: http://127.0.0.1:4096)
#   OPENCODE_API_KEY   bearer token sent with every request (default: local)

import opencode
import std/[asyncdispatch, os, strutils]

const DefaultBaseUrl = "http://127.0.0.1:4096"

proc baseUrl(): string =
  let url = getEnv("OPENCODE_BASE_URL", DefaultBaseUrl)
  result = if url.endsWith("/"): url else: url & "/"

proc apiKey(): string =
  getEnv("OPENCODE_API_KEY", "local")

proc getJson(client: OpencodeClient, endpoint: string): Future[JsonNode] {.async.} =
  ## Fetch a JSON payload. Used instead of the typed getApi* helpers because
  ## those always serialize the `location` query param, which the server rejects.
  let res = await client.httpGet(endpoint)
  result = fromJson(await res.body)

proc listItems(items: JsonNode, key: string): seq[string] =
  for item in items:
    if item.kind == JObject:
      result.add(item[key].getStr)

proc main() {.async.} =
  let client = initOpencodeClient(apiKey())
  client.baseUri = baseUrl()
  try:
    let agents = await client.getJson("/api/agent")
    echo "GET /api/agent (", agents["data"].len, ")"
    for id in listItems(agents["data"], "id"):
      echo "  - ", id

    let models = await client.getJson("/api/model")
    echo "GET /api/model (", models["data"].len, ")"
    for id in listItems(models["data"], "id"):
      echo "  - ", id

    let providers = await client.getJson("/api/provider")
    echo "GET /api/provider (", providers["data"].len, ")"
    for id in listItems(providers["data"], "id"):
      echo "  - ", id

    let commands = await client.getJson("/api/command")
    echo "GET /api/command (", commands["data"].len, ")"
    for name in listItems(commands["data"], "name"):
      echo "  - ", name

    let skills = await client.getJson("/api/skill")
    echo "GET /api/skill (", skills["data"].len, ")"
    for name in listItems(skills["data"], "name"):
      echo "  - ", name

    echo "GET /experimental/tool/ids"
    let toolIds = await client.getExperimentalToolIds()
    for t in toolIds:
      echo "  - ", t
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  waitFor main()
