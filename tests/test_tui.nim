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

suite "tui serialization":
  test "round-trips NotFoundError":
    let obj = newNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.NotFoundError)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips GetTuiControlNextResponse":
    let obj = opencode.GetTuiControlNextResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetTuiControlNextResponse)) == openjson.toJson(obj)

suite "tui endpoints":
  test "POST /tui/open-help":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiOpenHelp("test", "test")

  test "POST /tui/open-sessions":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiOpenSessions("test", "test")

  test "POST /tui/open-themes":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiOpenThemes("test", "test")

  test "POST /tui/open-models":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiOpenModels("test", "test")

  test "POST /tui/submit-prompt":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiSubmitPrompt("test", "test")

  test "POST /tui/clear-prompt":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiClearPrompt("test", "test")

  test "POST /tui/publish":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiPublish("test", "test")

  test "GET /tui/control/next":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTuiControlNext("test", "test")

  test "POST /tui/control/response":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTuiControlResponse("test", "test")

