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

suite "workspace serialization":
  test "round-trips Workspace":
    let obj = newWorkspace()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Workspace)) == openjson.toJson(obj)

  test "round-trips WorkspaceEventConnectionStatus":
    let obj = newWorkspaceEventConnectionStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.WorkspaceEventConnectionStatus)) == openjson.toJson(obj)

  test "round-trips NotFoundError":
    let obj = newNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.NotFoundError)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

suite "workspace endpoints":
  test "GET /experimental/workspace/adapter":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalWorkspaceAdapter("test", "test")

  test "GET /experimental/workspace":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalWorkspace("test", "test")

  test "POST /experimental/workspace/sync-list":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postExperimentalWorkspaceSyncList("test", "test")

  test "GET /experimental/workspace/status":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalWorkspaceStatus("test", "test")

  test "DELETE /experimental/workspace/{id}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteExperimentalWorkspaceId("test", "test", "test")

