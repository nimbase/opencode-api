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

suite "experimental serialization":
  test "round-trips WorktreeResetInput":
    let obj = newWorktreeResetInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.WorktreeResetInput)) == openjson.toJson(obj)

  test "round-trips Worktree":
    let obj = newWorktree()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Worktree)) == openjson.toJson(obj)

  test "round-trips ExperimentalCapabilities":
    let obj = newExperimentalCapabilities()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ExperimentalCapabilities)) == openjson.toJson(obj)

  test "round-trips GlobalSession":
    let obj = newGlobalSession()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GlobalSession)) == openjson.toJson(obj)

  test "round-trips WorktreeRemoveInput":
    let obj = newWorktreeRemoveInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.WorktreeRemoveInput)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips ConsoleState":
    let obj = newConsoleState()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ConsoleState)) == openjson.toJson(obj)

  test "round-trips EffectHttpApiErrorInternalServerError":
    let obj = newEffectHttpApiErrorInternalServerError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.EffectHttpApiErrorInternalServerError)) == openjson.toJson(obj)

  test "round-trips WorktreeCreateInput":
    let obj = newWorktreeCreateInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.WorktreeCreateInput)) == openjson.toJson(obj)

  test "round-trips GetExperimentalConsoleOrgsResponse":
    let obj = opencode.GetExperimentalConsoleOrgsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetExperimentalConsoleOrgsResponse)) == openjson.toJson(obj)

suite "experimental endpoints":
  test "GET /experimental/capabilities":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalCapabilities("test", "test")

  test "GET /experimental/console":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalConsole("test", "test")

  test "GET /experimental/console/orgs":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalConsoleOrgs("test", "test")

  test "GET /experimental/tool":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalTool("test", "test", "test", "test")

  test "GET /experimental/tool/ids":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalToolIds("test", "test")

  test "GET /experimental/worktree":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalWorktree("test", "test")

  test "POST /experimental/worktree":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postExperimentalWorktree("test", "test", newWorktreeCreateInput())

  test "DELETE /experimental/worktree":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteExperimentalWorktree("test", "test", newWorktreeRemoveInput())

  test "POST /experimental/worktree/reset":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postExperimentalWorktreeReset("test", "test", newWorktreeResetInput())

  test "GET /experimental/session":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalSession("test", "test", openjson.newJObject(), 1.0, 1.0, "test", 1.0, openjson.newJObject())

  test "POST /experimental/session/{sessionID}/background":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postExperimentalSessionSessionIDBackground("test", "test", "test")

  test "GET /experimental/resource":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getExperimentalResource("test", "test")

