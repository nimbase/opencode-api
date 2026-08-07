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
  PermissionRequestIDReplyRequest = object
    reply: string
    message: Option[string]

proc getPermission*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[GetPermissionResponse] {.async.} =
  ## Get all pending permission requests across all sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/permission", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetPermissionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postPermissionRequestIDReply*(client: OpencodeClient, requestID: string,
                                   directory: string = default(string),
                                   workspace: string = default(string),
                                   body: PermissionRequestIDReplyRequest): Future[PostPermissionRequestIDReplyResponse] {.async.} =
  ## Approve or deny a permission request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/permission/{requestID}/reply", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostPermissionRequestIDReplyResponse)
  else:
    raise newException(OpencodeClientError, body)
