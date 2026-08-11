# opencode client — configuration, providers, commands & agents
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r config.nim
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
    let config = await client.getConfig()
    echo "GET /config"
    echo "  model:         ", config.model.get("")
    echo "  smallModel:    ", config.small_model.get("")
    echo "  defaultAgent:  ", config.default_agent.get("")
    echo "  logLevel:      ", config.log_level.get(LogLevel.INFO)
    echo "  autoupdate:    ", toJson(config.autoupdate)

    let providers = await client.getConfigProviders()
    echo "GET /config/providers"
    let providersJson = toJsonNode(providers)
    for p in providersJson["providers"]:
      echo "  ", p["id"].getStr, "  -  ", p["name"].getStr
    echo "  default: ", toJson(providersJson["default"])

    let commands = await client.getCommand()
    echo "GET /command (", commands.len, ")"
    for c in commands:
      echo "  /", c.name
      let tpl = c.template.replace("\n", " ")
      echo "    ", if tpl.len > 90: tpl[0 ..< 90] & "..." else: tpl

    let agents = await client.getAgent()
    echo "GET /agent (", agents.len, ")"
    for a in agents:
      let desc = a.description.get("")
      echo "  ", a.name, "  -  ", if desc.len > 90: desc[0 ..< 90] & "..." else: desc
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  waitFor main()
