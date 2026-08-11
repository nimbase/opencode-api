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

suite "messages serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips SessionMessagesResponse":
    let obj = newSessionMessagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SessionMessagesResponse)) == openjson.toJson(obj)

  test "round-trips UnknownError1":
    let obj = newUnknownError1()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnknownError1)) == openjson.toJson(obj)

suite "messages endpoints":
  test "GET /api/session/{sessionID}/message":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDMessage("test", 1.0, {}, "test")

