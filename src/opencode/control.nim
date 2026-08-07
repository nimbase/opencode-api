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
  LogRequest = object
    service: string
    level: string
    message: string
    extra: Option[JsonNode]

proc putAuthProviderID*(client: OpencodeClient, providerID: string, body: Auth): Future[PutAuthProviderIDResponse] {.async.} =
  ## Set authentication credentials

  let res = await client.httpPUT(fmt"/auth/{providerID}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAuthProviderIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteAuthProviderID*(client: OpencodeClient, providerID: string): Future[DeleteAuthProviderIDResponse] {.async.} =
  ## Remove authentication credentials

  let res = await client.httpDELETE(fmt"/auth/{providerID}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAuthProviderIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postLog*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: LogRequest): Future[PostLogResponse] {.async.} =
  ## Write a log entry to the server logs with specified level and metadata.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostLogResponse)
  else:
    raise newException(OpencodeClientError, body)
