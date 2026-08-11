# opencode client — health & location example
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r health.nim
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
    let globalHealth = await client.getGlobalHealth()
    echo "GET /global/health"
    echo "  ", toJson(globalHealth)

    let apiHealth = await client.getApiHealth()
    echo "GET /api/health"
    echo "  ", toJson(apiHealth)

    # NOTE: the generated getApiLocation always serializes the `location` query
    # param, which the server rejects. Use the low-level httpGet instead.
    echo "GET /api/location"
    let locationRes = await client.httpGet("/api/location")
    let location = fromJson(await locationRes.body, LocationInfo)
    echo "  directory:    ", location.directory
    echo "  workspaceID:  ", location.workspace_i_d.get("")

    let path = await client.getPath()
    echo "GET /path"
    echo "  home:      ", path.home
    echo "  config:    ", path.config
    echo "  state:     ", path.state
    echo "  worktree:  ", path.worktree
    echo "  directory: ", path.directory
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  waitFor main()
