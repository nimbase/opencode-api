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
  ApiSessionRequest = object
    id: Option[string]
    agent: Option[string]
    model: Option[ModelRef]
    location: Option[LocationRef]
  PostApiSessionResponse* = object
    data: SessionV2Info
  GetApiSessionActiveResponse* = object
    data: JsonNode
  GetApiSessionSessionIDResponse* = object
    data: SessionV2Info
  ApiSessionSessionIDAgentRequest = object
    agent: string
  ApiSessionSessionIDModelRequest = object
    model: ModelRef
  ApiSessionSessionIDPromptRequest = object
    id: Option[string]
    prompt: PromptInput
    delivery: Option[string]
    resume: Option[bool]
  PostApiSessionSessionIDPromptResponse* = object
    data: SessionInputAdmitted
  ApiSessionSessionIDRevertStageRequest = object
    message_i_d: string
    files: Option[bool]
  PostApiSessionSessionIDRevertStageResponse* = object
    data: RevertState
  GetApiSessionSessionIDContextResponse* = object
    data: seq[SessionMessage]
  GetApiSessionSessionIDMessageMessageIDResponse* = object
    data: SessionMessage
  SessionOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc getApiSession*(client: OpencodeClient, workspace: string = default(string),
                    limit: float64 = default(float64),
                    order: set[SessionOrderOption] = {},
                    search: string = default(string),
                    directory: string = default(string),
                    project: string = default(string),
                    subpath: string = default(string),
                    cursor: string = default(string)): Future[SessionsResponse] {.async.} =
  ## Retrieve sessions in the requested order. Items keep that order across pages;
  ## use cursor.next or cursor.previous to move through the ordered list.

  var q = initOrderedTable[string, string]()
  q["workspace"] = $workspace
  q["limit"] = $limit
  for v in order: q["order"] = $v
  q["search"] = $search
  q["directory"] = $directory
  q["project"] = $project
  q["subpath"] = $subpath
  q["cursor"] = $cursor
  let res = await client.httpGET("/api/session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, SessionsResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSession*(client: OpencodeClient, body: ApiSessionRequest): Future[PostApiSessionResponse] {.async.} =
  ## Create a session at the requested location.

  let res = await client.httpPOST("/api/session", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiSessionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionActive*(client: OpencodeClient): Future[GetApiSessionActiveResponse] {.async.} =
  ## Retrieve foreground Session drains currently owned by this OpenCode process.
  ## Sessions absent from the result are inactive.

  let res = await client.httpGET("/api/session/active")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionActiveResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionSessionID*(client: OpencodeClient, sessionID: string): Future[GetApiSessionSessionIDResponse] {.async.} =
  ## Retrieve a session by ID.

  let res = await client.httpGET(fmt"/api/session/{sessionID}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDAgent*(client: OpencodeClient, sessionID: string,
                                   body: ApiSessionSessionIDAgentRequest): Future[AsyncResponse] {.async.} =
  ## Switch the agent used by subsequent provider turns.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/agent", body)
  return res

proc postApiSessionSessionIDModel*(client: OpencodeClient, sessionID: string,
                                   body: ApiSessionSessionIDModelRequest): Future[AsyncResponse] {.async.} =
  ## Switch the model used by subsequent provider turns.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/model", body)
  return res

proc postApiSessionSessionIDPrompt*(client: OpencodeClient, sessionID: string,
                                    body: ApiSessionSessionIDPromptRequest): Future[PostApiSessionSessionIDPromptResponse] {.async.} =
  ## Durably admit one session input and schedule agent-loop execution unless resume
  ## is false.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/prompt", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiSessionSessionIDPromptResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDCompact*(client: OpencodeClient, sessionID: string): Future[AsyncResponse] {.async.} =
  ## Compact a session conversation.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/compact")
  return res

proc postApiSessionSessionIDWait*(client: OpencodeClient, sessionID: string): Future[AsyncResponse] {.async.} =
  ## Wait for a session agent loop to become idle.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/wait")
  return res

proc postApiSessionSessionIDRevertStage*(client: OpencodeClient,
                                         sessionID: string,
                                         body: ApiSessionSessionIDRevertStageRequest): Future[PostApiSessionSessionIDRevertStageResponse] {.async.} =
  ## Stage or move a reversible session boundary and optionally apply its file
  ## changes.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/revert/stage", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiSessionSessionIDRevertStageResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDRevertClear*(client: OpencodeClient,
                                         sessionID: string): Future[AsyncResponse] {.async.} =
  ## Clear staged revert

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/revert/clear")
  return res

proc postApiSessionSessionIDRevertCommit*(client: OpencodeClient,
                                          sessionID: string): Future[AsyncResponse] {.async.} =
  ## Commit staged revert

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/revert/commit")
  return res

proc getApiSessionSessionIDContext*(client: OpencodeClient, sessionID: string): Future[GetApiSessionSessionIDContextResponse] {.async.} =
  ## Retrieve the active context messages for a session (all messages after the last
  ## compaction).

  let res = await client.httpGET(fmt"/api/session/{sessionID}/context")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDContextResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionSessionIDHistory*(client: OpencodeClient, sessionID: string,
                                    limit: string = default(string),
                                    after: string = default(string)): Future[SessionHistory] {.async.} =
  ## Read one finite page of public durable Session events after an exclusive
  ## aggregate sequence. Newly committed events may appear on later pages.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["after"] = $after
  let res = await client.httpGET(fmt"/api/session/{sessionID}/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, SessionHistory)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionSessionIDEvent*(client: OpencodeClient, sessionID: string,
                                  after: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Replay durable events after an aggregate sequence, then continue with new
  ## durable events.

  var q = initOrderedTable[string, string]()
  q["after"] = $after
  let res = await client.httpGET(fmt"/api/session/{sessionID}/event", q)
  return res

proc postApiSessionSessionIDInterrupt*(client: OpencodeClient, sessionID: string): Future[AsyncResponse] {.async.} =
  ## Interrupt active execution owned by this OpenCode process. Idle interruption is
  ## a no-op.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/interrupt")
  return res

proc getApiSessionSessionIDMessageMessageID*(client: OpencodeClient,
                                             sessionID: string,
                                             messageID: string): Future[GetApiSessionSessionIDMessageMessageIDResponse] {.async.} =
  ## Retrieve one projected message owned by the Session.

  let res = await client.httpGET(fmt"/api/session/{sessionID}/message/{messageID}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDMessageMessageIDResponse)
  else:
    raise newException(OpencodeClientError, body)
