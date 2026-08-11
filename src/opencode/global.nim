# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  GetGlobalHealthResponse* = object
    ## Health information
    healthy: bool
    version: string
  PostGlobalUpgradeRequest = object
    target: Option[string]

proc getGlobalHealth*(client: OpencodeClient): Future[GetGlobalHealthResponse] {.async.} =
  ## Get health information about the OpenCode server.

  let res = await client.httpGET("/global/health")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetGlobalHealthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getGlobalEvent*(client: OpencodeClient): Future[AsyncResponse] {.async.} =
  ## Subscribe to global events from the OpenCode system using server-sent events.

  let res = await client.httpGET("/global/event")
  return res

proc getGlobalConfig*(client: OpencodeClient): Future[types.Config] {.async.} =
  ## Retrieve the current global OpenCode configuration settings and preferences.

  let res = await client.httpGET("/global/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Config)
  else:
    raise newException(OpencodeClientError, body)

proc patchGlobalConfig*(client: OpencodeClient, body: types.Config): Future[types.Config] {.async.} =
  ## Update global OpenCode configuration settings and preferences.

  let res = await client.httpPATCH("/global/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Config)
  else:
    raise newException(OpencodeClientError, body)

proc postGlobalDispose*(client: OpencodeClient): Future[bool] {.async.} =
  ## Clean up and dispose all OpenCode instances, releasing all resources.

  let res = await client.httpPOST("/global/dispose")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postGlobalUpgrade*(client: OpencodeClient, body: PostGlobalUpgradeRequest): Future[JsonNode] {.async.} =
  ## Upgrade opencode to the specified version or latest if not specified.

  let res = await client.httpPOST("/global/upgrade", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(OpencodeClientError, body)
