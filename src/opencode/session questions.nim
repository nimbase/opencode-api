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
  GetApiQuestionRequestResponse* = object
    location: LocationInfo
    data: seq[QuestionV2Request]
  GetApiSessionSessionIDQuestionResponse* = object
    data: seq[QuestionV2Request]

proc getApiQuestionRequest*(client: OpencodeClient,
                            location: JsonNode = default(JsonNode)): Future[GetApiQuestionRequestResponse] {.async.} =
  ## Retrieve pending question requests for a location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/question/request", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiQuestionRequestResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiSessionSessionIDQuestion*(client: OpencodeClient, sessionID: string): Future[GetApiSessionSessionIDQuestionResponse] {.async.} =
  ## Retrieve pending question requests owned by a session.

  let res = await client.httpGET(fmt"/api/session/{sessionID}/question")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSessionSessionIDQuestionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiSessionSessionIDQuestionRequestIDReply*(client: OpencodeClient,
                                                    sessionID: string,
                                                    requestID: string,
                                                    body: QuestionV2Reply): Future[AsyncResponse] {.async.} =
  ## Answer a pending question request owned by a session.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/question/{requestID}/reply", body)
  return res

proc postApiSessionSessionIDQuestionRequestIDReject*(client: OpencodeClient,
                                                     sessionID: string,
                                                     requestID: string): Future[AsyncResponse] {.async.} =
  ## Reject a pending question request owned by a session.

  let res = await client.httpPOST(fmt"/api/session/{sessionID}/question/{requestID}/reject")
  return res
