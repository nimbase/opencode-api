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

suite "provider serialization":
  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips ProviderAuthAuthorization":
    let obj = newProviderAuthAuthorization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProviderAuthAuthorization)) == openjson.toJson(obj)

  test "round-trips Provider":
    let obj = newProvider()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Provider)) == openjson.toJson(obj)

  test "round-trips GetProviderResponse":
    let obj = opencode.GetProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetProviderResponse)) == openjson.toJson(obj)

suite "provider endpoints":
  test "GET /provider":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getProvider("test", "test")

  test "GET /provider/auth":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getProviderAuth("test", "test")

