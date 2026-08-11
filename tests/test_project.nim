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

suite "project serialization":
  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips ProjectNotFoundError":
    let obj = newProjectNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProjectNotFoundError)) == openjson.toJson(obj)

  test "round-trips Project":
    let obj = newProject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Project)) == openjson.toJson(obj)

  test "round-trips ProjectIcon":
    let obj = newProjectIcon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProjectIcon)) == openjson.toJson(obj)

  test "round-trips ProjectCommands":
    let obj = newProjectCommands()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProjectCommands)) == openjson.toJson(obj)

suite "project endpoints":
  test "GET /project":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getProject("test", "test")

  test "GET /project/current":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getProjectCurrent("test", "test")

  test "POST /project/git/init":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postProjectGitInit("test", "test")

  test "GET /project/{projectID}/directories":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getProjectProjectIDDirectories("test", "test", "test")

