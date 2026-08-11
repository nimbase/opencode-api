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

suite "config serialization":
  test "round-trips Config":
    let obj = newConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Config)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips Provider":
    let obj = newProvider()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Provider)) == openjson.toJson(obj)

  test "round-trips GetConfigProvidersResponse":
    let obj = opencode.GetConfigProvidersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetConfigProvidersResponse)) == openjson.toJson(obj)

suite "config endpoints":
  test "GET /config":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getConfig("test", "test")

  test "PATCH /config":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchConfig("test", "test", newConfig())

  test "GET /config/providers":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getConfigProviders("test", "test")

