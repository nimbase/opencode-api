# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostPermissionRequestIDReplyRequest = object
    reply: string
    message: Option[string]

proc getPermission*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[seq[types.PermissionRequest]] {.async.} =
  ## Get all pending permission requests across all sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/permission", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.PermissionRequest])
  else:
    raise newException(OpencodeClientError, body)

proc postPermissionRequestIDReply*(client: OpencodeClient, requestID: string,
                                   directory: string = default(string),
                                   workspace: string = default(string),
                                   body: PostPermissionRequestIDReplyRequest): Future[bool] {.async.} =
  ## Approve or deny a permission request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/permission/{requestID}/reply", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
