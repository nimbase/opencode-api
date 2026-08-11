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

suite "event serialization":
  test "round-trips Event":
    let obj = newEvent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Event)) == openjson.toJson(obj)

suite "event endpoints":
  test "GET /event":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getEvent("test", "test")

