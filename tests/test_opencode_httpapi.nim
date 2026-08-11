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

suite "opencode_httpapi serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips AgentV2Info":
    let obj = newAgentV2Info()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.AgentV2Info)) == openjson.toJson(obj)

  test "round-trips GetApiHealthResponse":
    let obj = opencode.GetApiHealthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiHealthResponse)) == openjson.toJson(obj)

  test "round-trips GetApiAgentResponse":
    let obj = opencode.GetApiAgentResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiAgentResponse)) == openjson.toJson(obj)

suite "opencode_httpapi endpoints":
  test "GET /api/health":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiHealth()

  test "GET /api/location":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiLocation(openjson.newJObject())

  test "GET /api/agent":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiAgent(openjson.newJObject())

  test "DELETE /api/credential/{credentialID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteApiCredentialCredentialID("test", openjson.newJObject())

