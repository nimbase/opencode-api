# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import opencode
import ./common

suite "session_questions serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips QuestionV2Reply":
    let obj = newQuestionV2Reply()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.QuestionV2Reply)) == openjson.toJson(obj)

  test "round-trips QuestionV2Request":
    let obj = newQuestionV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.QuestionV2Request)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips GetApiQuestionRequestResponse":
    let obj = opencode.GetApiQuestionRequestResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiQuestionRequestResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDQuestionResponse":
    let obj = opencode.GetApiSessionSessionIDQuestionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDQuestionResponse)) == openjson.toJson(obj)

suite "session_questions endpoints":
  test "GET /api/question/request":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiQuestionRequest(openjson.newJObject())

  test "GET /api/session/{sessionID}/question":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDQuestion("test")

  test "POST /api/session/{sessionID}/question/{requestID}/reply":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDQuestionRequestIDReply("test", "test", newQuestionV2Reply())

  test "POST /api/session/{sessionID}/question/{requestID}/reject":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDQuestionRequestIDReject("test", "test")

