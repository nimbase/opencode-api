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

suite "providers serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips ProviderV2Info":
    let obj = newProviderV2Info()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProviderV2Info)) == openjson.toJson(obj)

  test "round-trips ServiceUnavailableError":
    let obj = newServiceUnavailableError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ServiceUnavailableError)) == openjson.toJson(obj)

  test "round-trips ProviderNotFoundError":
    let obj = newProviderNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProviderNotFoundError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips GetApiProviderResponse":
    let obj = opencode.GetApiProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiProviderResponse)) == openjson.toJson(obj)

  test "round-trips GetApiProviderProviderIDResponse":
    let obj = opencode.GetApiProviderProviderIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiProviderProviderIDResponse)) == openjson.toJson(obj)

suite "providers endpoints":
  test "GET /api/provider":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiProvider(openjson.newJObject())

  test "GET /api/provider/{providerID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiProviderProviderID("test", openjson.newJObject())

