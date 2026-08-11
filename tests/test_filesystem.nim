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

suite "filesystem serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips FileSystemEntry":
    let obj = newFileSystemEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.FileSystemEntry)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips GetApiFsListResponse":
    let obj = opencode.GetApiFsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiFsListResponse)) == openjson.toJson(obj)

  test "round-trips GetApiFsFindResponse":
    let obj = opencode.GetApiFsFindResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiFsFindResponse)) == openjson.toJson(obj)

suite "filesystem endpoints":
  test "GET /api/fs/read/*":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiFsRead(openjson.newJObject())

  test "GET /api/fs/list":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiFsList(openjson.newJObject(), "test")

  test "GET /api/fs/find":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiFsFind(openjson.newJObject(), "test", {}, "test")

