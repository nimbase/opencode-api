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

suite "sessions serialization":
  test "round-trips SessionsResponse":
    let obj = newSessionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionsResponse)) == openjson.toJson(obj)

  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips PromptInput":
    let obj = newPromptInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PromptInput)) == openjson.toJson(obj)

  test "round-trips ModelRef":
    let obj = newModelRef()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ModelRef)) == openjson.toJson(obj)

  test "round-trips ServiceUnavailableError":
    let obj = newServiceUnavailableError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ServiceUnavailableError)) == openjson.toJson(obj)

  test "round-trips SessionInputAdmitted":
    let obj = newSessionInputAdmitted()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionInputAdmitted)) == openjson.toJson(obj)

  test "round-trips UnknownError1":
    let obj = newUnknownError1()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnknownError1)) == openjson.toJson(obj)

  test "round-trips LocationRef":
    let obj = newLocationRef()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationRef)) == openjson.toJson(obj)

  test "round-trips SessionMessage":
    let obj = newSessionMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionMessage)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips ConflictError":
    let obj = newConflictError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ConflictError)) == openjson.toJson(obj)

  test "round-trips SessionV2Info":
    let obj = newSessionV2Info()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionV2Info)) == openjson.toJson(obj)

  test "round-trips RevertState":
    let obj = newRevertState()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.RevertState)) == openjson.toJson(obj)

  test "round-trips SessionHistory":
    let obj = newSessionHistory()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionHistory)) == openjson.toJson(obj)

  test "round-trips PostApiSessionResponse":
    let obj = opencode.PostApiSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiSessionResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionActiveResponse":
    let obj = opencode.GetApiSessionActiveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionActiveResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDResponse":
    let obj = opencode.GetApiSessionSessionIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDResponse)) == openjson.toJson(obj)

  test "round-trips PostApiSessionSessionIDPromptResponse":
    let obj = opencode.PostApiSessionSessionIDPromptResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiSessionSessionIDPromptResponse)) == openjson.toJson(obj)

  test "round-trips PostApiSessionSessionIDRevertStageResponse":
    let obj = opencode.PostApiSessionSessionIDRevertStageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiSessionSessionIDRevertStageResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDContextResponse":
    let obj = opencode.GetApiSessionSessionIDContextResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDContextResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDMessageMessageIDResponse":
    let obj = opencode.GetApiSessionSessionIDMessageMessageIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDMessageMessageIDResponse)) == openjson.toJson(obj)

suite "sessions endpoints":
  test "GET /api/session":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSession("test", 1.0, {}, "test", "test", "test", "test", "test")

  test "GET /api/session/active":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionActive()

  test "GET /api/session/{sessionID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionID("test")

  test "POST /api/session/{sessionID}/compact":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDCompact("test")

  test "POST /api/session/{sessionID}/wait":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDWait("test")

  test "POST /api/session/{sessionID}/revert/clear":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDRevertClear("test")

  test "POST /api/session/{sessionID}/revert/commit":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDRevertCommit("test")

  test "GET /api/session/{sessionID}/context":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDContext("test")

  test "GET /api/session/{sessionID}/history":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDHistory("test", "test", "test")

  test "GET /api/session/{sessionID}/event":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDEvent("test", "test")

  test "POST /api/session/{sessionID}/interrupt":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiSessionSessionIDInterrupt("test")

  test "GET /api/session/{sessionID}/message/{messageID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDMessageMessageID("test", "test")

