# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PostQuestionRequestIDReplyRequest = object
    answers: seq[types.QuestionAnswer]

proc getQuestion*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string)): Future[seq[types.QuestionRequest]] {.async.} =
  ## Get all pending question requests across all sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/question", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.QuestionRequest])
  else:
    raise newException(OpencodeClientError, body)

proc postQuestionRequestIDReply*(client: OpencodeClient, requestID: string,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 body: PostQuestionRequestIDReplyRequest): Future[bool] {.async.} =
  ## Provide answers to a question request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/question/{requestID}/reply", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postQuestionRequestIDReject*(client: OpencodeClient, requestID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[bool] {.async.} =
  ## Reject a question request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/question/{requestID}/reject", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
