# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Clue CLI Assistant https://github.com/openpeeps/clue
#
# Generated at: 2026-08-07T13:12:58+03:00
# License: MIT
import std/[strformat, options, json]
import ./metaclient
import ./types

type
  GetConfigProvidersResponse* = object
    ## List of providers
    providers: seq[Provider]
    default: JsonNode

proc getConfig*(client: OpencodeClient, directory: string = default(string),
                workspace: string = default(string)): Future[Config] {.async.} =
  ## Retrieve the current OpenCode configuration settings and preferences.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/config", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Config)
  else:
    raise newException(OpencodeClientError, body)

proc patchConfig*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string), body: Config): Future[Config] {.async.} =
  ## Update OpenCode configuration settings and preferences.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPATCH("/config", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Config)
  else:
    raise newException(OpencodeClientError, body)

proc getConfigProviders*(client: OpencodeClient,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[GetConfigProvidersResponse] {.async.} =
  ## Get a list of all configured AI providers and their default models.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/config/providers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetConfigProvidersResponse)
  else:
    raise newException(OpencodeClientError, body)
