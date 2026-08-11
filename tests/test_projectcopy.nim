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

suite "projectcopy serialization":
  test "round-trips ProjectCopyCopy":
    let obj = newProjectCopyCopy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ProjectCopyCopy)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips PostExperimentalProjectProjectIDCopyGenerateNameResponse":
    let obj = opencode.PostExperimentalProjectProjectIDCopyGenerateNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostExperimentalProjectProjectIDCopyGenerateNameResponse)) == openjson.toJson(obj)

suite "projectcopy endpoints":
  test "POST /experimental/project/{projectID}/copy/refresh":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postExperimentalProjectProjectIDCopyRefresh("test", openjson.newJObject())

