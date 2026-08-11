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

suite "models serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips ServiceUnavailableError":
    let obj = newServiceUnavailableError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ServiceUnavailableError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips ModelV2Info":
    let obj = newModelV2Info()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ModelV2Info)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips GetApiModelResponse":
    let obj = opencode.GetApiModelResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiModelResponse)) == openjson.toJson(obj)

suite "models endpoints":
  test "GET /api/model":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiModel(openjson.newJObject())

