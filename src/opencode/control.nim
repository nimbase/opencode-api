# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostLogRequest = object
    service: string
    level: string
    message: string
    extra: Option[JsonNode]

proc putAuthProviderID*(client: OpencodeClient, providerID: string,
                        body: types.Auth): Future[bool] {.async.} =
  ## Set authentication credentials

  let res = await client.httpPUT(fmt"/auth/{providerID}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc deleteAuthProviderID*(client: OpencodeClient, providerID: string): Future[bool] {.async.} =
  ## Remove authentication credentials

  let res = await client.httpDELETE(fmt"/auth/{providerID}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postLog*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: PostLogRequest): Future[bool] {.async.} =
  ## Write a log entry to the server logs with specified level and metadata.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
