# opencode client — sessions example
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r sessions.nim
#
# Config via environment:
#   OPENCODE_BASE_URL  server base URL (default: http://127.0.0.1:4096)
#   OPENCODE_API_KEY   bearer token sent with every request (default: local)

import opencode
import std/[asyncdispatch, os, strutils, options]

const DefaultBaseUrl = "http://127.0.0.1:4096"

proc baseUrl(): string =
  let url = getEnv("OPENCODE_BASE_URL", DefaultBaseUrl)
  result = if url.endsWith("/"): url else: url & "/"

proc apiKey(): string =
  getEnv("OPENCODE_API_KEY", "local")

proc main() {.async.} =
  let client = initOpencodeClient(apiKey())
  client.baseUri = baseUrl()
  try:
    # NOTE: the generated getApiSession always serializes the `workspace` query
    # param, which the server rejects. Use the low-level httpGet instead.
    echo "GET /api/session"
    let listRes = await client.httpGet("/api/session")
    let sessions = fromJson(await listRes.body, SessionsResponse)
    echo "  ", sessions.data.len, " session(s)"
    for s in sessions.data:
      let model = if s.model.isSome: s.model.get.id else: ""
      echo "  ", s.id, "  title=", s.title, "  agent=", s.agent.get(""), "  model=", model

    if sessions.data.len == 0:
      echo "no sessions found; create one with session_chat.nim"
      return

    let first = sessions.data[0]
    echo "GET /api/session/{id}"
    echo "  ", toJson(await client.getApiSessionSessionID(first.id))

    echo "POST /api/session/{id}/wait"
    let waited = await client.postApiSessionSessionIDWait(first.id)
    echo "  HTTP ", waited.code

    echo "GET /api/session/{id}/context (", first.id, ")"
    let ctxRes = await client.httpGet("/api/session/" & first.id & "/context")
    echo "  ", await ctxRes.body

    echo "GET /api/session/{id}/history (", first.id, ")"
    let historyRes = await client.httpGet("/api/session/" & first.id & "/history")
    let history = fromJson(await historyRes.body)
    echo "  has_more: ", history["hasMore"].getBool
    for event in history["data"]:
      echo "  - ", toJson(event)
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  waitFor main()
