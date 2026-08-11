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

suite "mcp serialization":
  test "round-trips McpServerNotFoundError":
    let obj = newMcpServerNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.McpServerNotFoundError)) == openjson.toJson(obj)

  test "round-trips MCPStatus":
    let obj = newMCPStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.MCPStatus)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips PostMcpNameAuthResponse":
    let obj = opencode.PostMcpNameAuthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostMcpNameAuthResponse)) == openjson.toJson(obj)

  test "round-trips DeleteMcpNameAuthResponse":
    let obj = opencode.DeleteMcpNameAuthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.DeleteMcpNameAuthResponse)) == openjson.toJson(obj)

suite "mcp endpoints":
  test "GET /mcp":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getMcp("test", "test")

  test "POST /mcp/{name}/auth":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postMcpNameAuth("test", "test", "test")

  test "DELETE /mcp/{name}/auth":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteMcpNameAuth("test", "test", "test")

  test "POST /mcp/{name}/auth/authenticate":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postMcpNameAuthAuthenticate("test", "test", "test")

  test "POST /mcp/{name}/connect":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postMcpNameConnect("test", "test", "test")

  test "POST /mcp/{name}/disconnect":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postMcpNameDisconnect("test", "test", "test")

