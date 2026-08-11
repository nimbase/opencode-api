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

suite "permissions serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips PermissionSavedInfo":
    let obj = newPermissionSavedInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PermissionSavedInfo)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips PermissionV2Request":
    let obj = newPermissionV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PermissionV2Request)) == openjson.toJson(obj)

  test "round-trips PermissionV2Source":
    let obj = newPermissionV2Source()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PermissionV2Source)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips GetApiPermissionRequestResponse":
    let obj = opencode.GetApiPermissionRequestResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiPermissionRequestResponse)) == openjson.toJson(obj)

  test "round-trips GetApiPermissionSavedResponse":
    let obj = opencode.GetApiPermissionSavedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiPermissionSavedResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDPermissionResponse":
    let obj = opencode.GetApiSessionSessionIDPermissionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDPermissionResponse)) == openjson.toJson(obj)

  test "round-trips PostApiSessionSessionIDPermissionResponse":
    let obj = opencode.PostApiSessionSessionIDPermissionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiSessionSessionIDPermissionResponse)) == openjson.toJson(obj)

  test "round-trips GetApiSessionSessionIDPermissionRequestIDResponse":
    let obj = opencode.GetApiSessionSessionIDPermissionRequestIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSessionSessionIDPermissionRequestIDResponse)) == openjson.toJson(obj)

suite "permissions endpoints":
  test "GET /api/permission/request":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiPermissionRequest(openjson.newJObject())

  test "GET /api/permission/saved":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiPermissionSaved("test")

  test "DELETE /api/permission/saved/{id}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteApiPermissionSavedId("test")

  test "GET /api/session/{sessionID}/permission":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDPermission("test")

  test "GET /api/session/{sessionID}/permission/{requestID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSessionSessionIDPermissionRequestID("test", "test")

