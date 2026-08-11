# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types

type
  GetConfigProvidersResponse* = object
    ## List of providers
    providers: seq[types.Provider]
    default: JsonNode

proc getConfig*(client: OpencodeClient, directory: string = default(string),
                workspace: string = default(string)): Future[types.Config] {.async.} =
  ## Retrieve the current OpenCode configuration settings and preferences.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/config", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Config)
  else:
    raise newException(OpencodeClientError, body)

proc patchConfig*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string), body: types.Config): Future[types.Config] {.async.} =
  ## Update OpenCode configuration settings and preferences.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPATCH("/config", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Config)
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
