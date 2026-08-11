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

suite "skills serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips SkillV2Info":
    let obj = newSkillV2Info()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.SkillV2Info)) == openjson.toJson(obj)

  test "round-trips GetApiSkillResponse":
    let obj = opencode.GetApiSkillResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiSkillResponse)) == openjson.toJson(obj)

suite "skills endpoints":
  test "GET /api/skill":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiSkill(openjson.newJObject())

