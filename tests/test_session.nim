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

suite "session serialization":
  test "round-trips Message":
    let obj = newMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Message)) == openjson.toJson(obj)

  test "round-trips NotFoundError":
    let obj = newNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.NotFoundError)) == openjson.toJson(obj)

  test "round-trips SnapshotFileDiff":
    let obj = newSnapshotFileDiff()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SnapshotFileDiff)) == openjson.toJson(obj)

  test "round-trips Part":
    let obj = newPart()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Part)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips Session":
    let obj = newSession()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Session)) == openjson.toJson(obj)

  test "round-trips Todo":
    let obj = newTodo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Todo)) == openjson.toJson(obj)

  test "round-trips OutputFormat":
    let obj = newOutputFormat()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.OutputFormat)) == openjson.toJson(obj)

  test "round-trips AssistantMessage":
    let obj = newAssistantMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.AssistantMessage)) == openjson.toJson(obj)

  test "round-trips EffectHttpApiErrorInternalServerError":
    let obj = newEffectHttpApiErrorInternalServerError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.EffectHttpApiErrorInternalServerError)) == openjson.toJson(obj)

  test "round-trips SessionBusyError":
    let obj = newSessionBusyError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionBusyError)) == openjson.toJson(obj)

  test "round-trips FilePartSource":
    let obj = newFilePartSource()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.FilePartSource)) == openjson.toJson(obj)

  test "round-trips PostSessionSessionIDMessageResponse":
    let obj = opencode.PostSessionSessionIDMessageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostSessionSessionIDMessageResponse)) == openjson.toJson(obj)

  test "round-trips GetSessionSessionIDMessageMessageIDResponse":
    let obj = opencode.GetSessionSessionIDMessageMessageIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetSessionSessionIDMessageMessageIDResponse)) == openjson.toJson(obj)

  test "round-trips PostSessionSessionIDCommandResponse":
    let obj = opencode.PostSessionSessionIDCommandResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostSessionSessionIDCommandResponse)) == openjson.toJson(obj)

  test "round-trips PostSessionSessionIDShellResponse":
    let obj = opencode.PostSessionSessionIDShellResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostSessionSessionIDShellResponse)) == openjson.toJson(obj)

suite "session endpoints":
  test "GET /session":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSession("test", "test", {}, "test", openjson.newJObject(), 1.0, "test", 1.0)

  test "GET /session/status":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionStatus("test", "test")

  test "GET /session/{sessionID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionID("test", "test", "test")

  test "DELETE /session/{sessionID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteSessionSessionID("test", "test", "test")

  test "GET /session/{sessionID}/children":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionIDChildren("test", "test", "test")

  test "GET /session/{sessionID}/todo":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionIDTodo("test", "test", "test")

  test "GET /session/{sessionID}/diff":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionIDDiff("test", "test", "test", "test")

  test "GET /session/{sessionID}/message":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionIDMessage("test", "test", "test", 1, "test")

  test "GET /session/{sessionID}/message/{messageID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSessionSessionIDMessageMessageID("test", "test", "test", "test")

  test "DELETE /session/{sessionID}/message/{messageID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteSessionSessionIDMessageMessageID("test", "test", "test", "test")

  test "POST /session/{sessionID}/abort":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSessionSessionIDAbort("test", "test", "test")

  test "POST /session/{sessionID}/share":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSessionSessionIDShare("test", "test", "test")

  test "DELETE /session/{sessionID}/share":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteSessionSessionIDShare("test", "test", "test")

  test "POST /session/{sessionID}/unrevert":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSessionSessionIDUnrevert("test", "test", "test")

  test "DELETE /session/{sessionID}/message/{messageID}/part/{partID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteSessionSessionIDMessageMessageIDPartPartID("test", "test", "test", "test", "test")

  test "PATCH /session/{sessionID}/message/{messageID}/part/{partID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchSessionSessionIDMessageMessageIDPartPartID("test", "test", "test", "test", "test", newPart())

