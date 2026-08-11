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

suite "instance serialization":
  test "round-trips VcsInfo":
    let obj = newVcsInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.VcsInfo)) == openjson.toJson(obj)

  test "round-trips Agent":
    let obj = newAgent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Agent)) == openjson.toJson(obj)

  test "round-trips LSPStatus":
    let obj = newLSPStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LSPStatus)) == openjson.toJson(obj)

  test "round-trips FormatterStatus":
    let obj = newFormatterStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.FormatterStatus)) == openjson.toJson(obj)

  test "round-trips VcsFileDiff":
    let obj = newVcsFileDiff()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.VcsFileDiff)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips Command":
    let obj = newCommand()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Command)) == openjson.toJson(obj)

  test "round-trips Path":
    let obj = newPath()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Path)) == openjson.toJson(obj)

  test "round-trips VcsFileStatus":
    let obj = newVcsFileStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.VcsFileStatus)) == openjson.toJson(obj)

  test "round-trips PostVcsApplyResponse":
    let obj = opencode.PostVcsApplyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostVcsApplyResponse)) == openjson.toJson(obj)

suite "instance endpoints":
  test "POST /instance/dispose":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postInstanceDispose("test", "test")

  test "GET /path":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPath("test", "test")

  test "GET /vcs":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getVcs("test", "test")

  test "GET /vcs/status":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getVcsStatus("test", "test")

  test "GET /vcs/diff":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getVcsDiff("test", "test", {}, 1)

  test "GET /vcs/diff/raw":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getVcsDiffRaw("test", "test")

  test "GET /command":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCommand("test", "test")

  test "GET /agent":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAgent("test", "test")

  test "GET /skill":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSkill("test", "test")

  test "GET /lsp":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getLsp("test", "test")

  test "GET /formatter":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getFormatter("test", "test")

