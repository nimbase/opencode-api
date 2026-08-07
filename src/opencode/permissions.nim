# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Clue CLI Assistant https://github.com/openpeeps/clue
#
# Generated at: 2026-08-07T13:04:19+03:00
# License: MIT
import std/[strformat, options, json]
import ./metaclient
import ./types

type
  GetApiPermissionRequestResponse* = object
    location: LocationInfo
    data: seq[PermissionV2Request]
  GetApiPermissionSavedResponse* = object
    data: seq[PermissionSavedInfo]
  GetApiSessionSessionIDPermissionResponse* = object
    data: seq[PermissionV2Request]
  ApiSessionSessionIDPermissionRequest = object
    id: Option[string]
    action: string
    resources: seq[string]
    save: Option[seq[string]]
    metadata: Option[JsonNode]
    source: Option[PermissionV2Source]
    agent: Option[string]
  PostApiSessionSessionIDPermissionResponse* = object
    data: JsonNode
  GetApiSessionSessionIDPermissionRequestIDResponse* = object
    data: PermissionV2Request
  ApiSessionSessionIDPermissionRequestIDReplyRequest = object
    reply: PermissionV2Reply
    message: Option[string]

proc getApiPermissionRequest*(client: OpencodeClient,
                              location: JsonNode = default(JsonNode)): Future[GetApiPermissionRequestResponse] {.async.} =
  ## Retrieve pending permission requests for a location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/permission/request", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiPermissionRequestResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiPermissionSaved*(client: OpencodeClient,
                            projectID: string = default(string)): Future[GetApiPermissionSavedResponse] {.async.} =
  ## Retrieve saved permissions, optionally filtered by project.

  var q = initOrderedTable[string, string]()
  q["projectID"] = $projectID
  let res = await client.httpGET("/api/permission/saved", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiPermissionSavedResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteApiPermissionSavedId*(client: OpencodeClient, id: string): Future[AsyncResponse] {.async.} =
  ## Remove a saved permission by ID.

  let res = await client.httpDELETE(fmt"/api/permission/saved/{id}")
  return res

proc getApiSessionSessionIDPermission*(client: OpencodeClient, sessionID: string): Future[GetApiSessionSessionIDPermissionResponse] {.async.} =
  ## Retrieve pending permission requests owned by a session.

  let res = await client.httpGET(fmt"/api/session/{sessionID}/permission")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDPermissionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDPermission*(client: OpencodeClient,
                                        sessionID: string,
                                        body: ApiSessionSessionIDPermissionRequest): Future[PostApiSessionSessionIDPermissionResponse] {.async.} =
  ## Evaluate and, when approval is required, create a permission request for a
  ## session.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/permission", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiSessionSessionIDPermissionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionSessionIDPermissionRequestID*(client: OpencodeClient,
                                                sessionID: string,
                                                requestID: string): Future[GetApiSessionSessionIDPermissionRequestIDResponse] {.async.} =
  ## Retrieve a pending permission request owned by a session.

  let res = await client.httpGET(fmt"/api/session/{sessionID}/permission/{requestID}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDPermissionRequestIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDPermissionRequestIDReply*(client: OpencodeClient,
                                                      sessionID: string,
                                                      requestID: string,
                                                      body: ApiSessionSessionIDPermissionRequestIDReplyRequest): Future[AsyncResponse] {.async.} =
  ## Respond to a pending permission request owned by a session.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/permission/{requestID}/reply", body)
  return res
