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

suite "integrations serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips IntegrationInfo":
    let obj = newIntegrationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.IntegrationInfo)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips IntegrationAttempt":
    let obj = newIntegrationAttempt()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.IntegrationAttempt)) == openjson.toJson(obj)

  test "round-trips IntegrationAttemptStatus":
    let obj = newIntegrationAttemptStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.IntegrationAttemptStatus)) == openjson.toJson(obj)

  test "round-trips GetApiIntegrationResponse":
    let obj = opencode.GetApiIntegrationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiIntegrationResponse)) == openjson.toJson(obj)

  test "round-trips GetApiIntegrationIntegrationIDResponse":
    let obj = opencode.GetApiIntegrationIntegrationIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiIntegrationIntegrationIDResponse)) == openjson.toJson(obj)

  test "round-trips PostApiIntegrationIntegrationIDConnectOauthResponse":
    let obj = opencode.PostApiIntegrationIntegrationIDConnectOauthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiIntegrationIntegrationIDConnectOauthResponse)) == openjson.toJson(obj)

  test "round-trips GetApiIntegrationAttemptAttemptIDResponse":
    let obj = opencode.GetApiIntegrationAttemptAttemptIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiIntegrationAttemptAttemptIDResponse)) == openjson.toJson(obj)

suite "integrations endpoints":
  test "GET /api/integration":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiIntegration(openjson.newJObject())

  test "GET /api/integration/{integrationID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiIntegrationIntegrationID("test", openjson.newJObject())

  test "GET /api/integration/attempt/{attemptID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiIntegrationAttemptAttemptID("test", openjson.newJObject())

  test "DELETE /api/integration/attempt/{attemptID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteApiIntegrationAttemptAttemptID("test", openjson.newJObject())

