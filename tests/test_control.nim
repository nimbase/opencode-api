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

suite "control serialization":
  test "round-trips Auth":
    let obj = newAuth()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Auth)) == openjson.toJson(obj)

suite "control endpoints":
  test "PUT /auth/{providerID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAuthProviderID("test", newAuth())

  test "DELETE /auth/{providerID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAuthProviderID("test")

