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

suite "question serialization":
  test "round-trips QuestionNotFoundError":
    let obj = newQuestionNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.QuestionNotFoundError)) == openjson.toJson(obj)

  test "round-trips QuestionRequest":
    let obj = newQuestionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.QuestionRequest)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

suite "question endpoints":
  test "GET /question":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getQuestion("test", "test")

  test "POST /question/{requestID}/reject":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postQuestionRequestIDReject("test", "test", "test")

