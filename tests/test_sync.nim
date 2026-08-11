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

suite "sync serialization":
  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips PostSyncReplayResponse":
    let obj = opencode.PostSyncReplayResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostSyncReplayResponse)) == openjson.toJson(obj)

  test "round-trips PostSyncStealResponse":
    let obj = opencode.PostSyncStealResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostSyncStealResponse)) == openjson.toJson(obj)

suite "sync endpoints":
  test "POST /sync/start":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSyncStart("test", "test")

  test "POST /sync/history":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSyncHistory("test", "test")

