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

suite "permission serialization":
  test "round-trips PermissionNotFoundError":
    let obj = newPermissionNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PermissionNotFoundError)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips PermissionRequest":
    let obj = newPermissionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PermissionRequest)) == openjson.toJson(obj)

suite "permission endpoints":
  test "GET /permission":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPermission("test", "test")

