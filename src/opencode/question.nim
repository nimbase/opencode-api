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
  QuestionRequestIDReplyRequest = object
    answers: seq[QuestionAnswer]

proc getQuestion*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string)): Future[GetQuestionResponse] {.async.} =
  ## Get all pending question requests across all sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/question", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetQuestionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postQuestionRequestIDReply*(client: OpencodeClient, requestID: string,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 body: QuestionRequestIDReplyRequest): Future[PostQuestionRequestIDReplyResponse] {.async.} =
  ## Provide answers to a question request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/question/{requestID}/reply", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostQuestionRequestIDReplyResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postQuestionRequestIDReject*(client: OpencodeClient, requestID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[PostQuestionRequestIDRejectResponse] {.async.} =
  ## Reject a question request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/question/{requestID}/reject", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostQuestionRequestIDRejectResponse)
  else:
    raise newException(OpencodeClientError, body)
