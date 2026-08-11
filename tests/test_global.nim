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

suite "global serialization":
  test "round-trips Config":
    let obj = newConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Config)) == openjson.toJson(obj)

  test "round-trips GlobalEvent":
    let obj = newGlobalEvent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GlobalEvent)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips GetGlobalHealthResponse":
    let obj = opencode.GetGlobalHealthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetGlobalHealthResponse)) == openjson.toJson(obj)

suite "global endpoints":
  test "GET /global/health":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getGlobalHealth()

  test "GET /global/event":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getGlobalEvent()

  test "GET /global/config":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getGlobalConfig()

  test "PATCH /global/config":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchGlobalConfig(newConfig())

  test "POST /global/dispose":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postGlobalDispose()

