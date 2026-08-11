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

suite "file serialization":
  test "round-trips Symbol":
    let obj = newSymbol()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Symbol)) == openjson.toJson(obj)

  test "round-trips FileNode":
    let obj = newFileNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.FileNode)) == openjson.toJson(obj)

  test "round-trips File":
    let obj = newFile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.File)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips FileContent":
    let obj = newFileContent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.FileContent)) == openjson.toJson(obj)

suite "file endpoints":
  test "GET /find":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFind("test", "test", "test")

  test "GET /find/file":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFindFile("test", "test", "test", {}, {}, 1)

  test "GET /find/symbol":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFindSymbol("test", "test", "test")

  test "GET /file":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFile("test", "test", "test")

  test "GET /file/content":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFileContent("test", "test", "test")

  test "GET /file/status":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFileStatus("test", "test")

