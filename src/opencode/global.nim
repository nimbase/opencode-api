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
  GetGlobalHealthResponse* = object
    ## Health information
    healthy: bool
    version: string
  GlobalUpgradeRequest = object
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

proc getGlobalConfig*(client: OpencodeClient): Future[Config] {.async.} =
  ## Retrieve the current global OpenCode configuration settings and preferences.

  let res = await client.httpGET("/global/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Config)
  else:
    raise newException(OpencodeClientError, body)

proc patchGlobalConfig*(client: OpencodeClient, body: Config): Future[Config] {.async.} =
  ## Update global OpenCode configuration settings and preferences.

  let res = await client.httpPATCH("/global/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Config)
  else:
    raise newException(OpencodeClientError, body)

proc postGlobalDispose*(client: OpencodeClient): Future[PostGlobalDisposeResponse] {.async.} =
  ## Clean up and dispose all OpenCode instances, releasing all resources.

  let res = await client.httpPOST("/global/dispose")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostGlobalDisposeResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postGlobalUpgrade*(client: OpencodeClient, body: GlobalUpgradeRequest): Future[PostGlobalUpgradeResponse] {.async.} =
  ## Upgrade opencode to the specified version or latest if not specified.

  let res = await client.httpPOST("/global/upgrade", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostGlobalUpgradeResponse)
  else:
    raise newException(OpencodeClientError, body)
