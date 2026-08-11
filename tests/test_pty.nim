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

suite "pty serialization":
  test "round-trips UnauthorizedError":
    let obj = newUnauthorizedError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.UnauthorizedError)) == openjson.toJson(obj)

  test "round-trips LocationInfo":
    let obj = newLocationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.LocationInfo)) == openjson.toJson(obj)

  test "round-trips NotFoundError":
    let obj = newNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.NotFoundError)) == openjson.toJson(obj)

  test "round-trips ForbiddenError":
    let obj = newForbiddenError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.ForbiddenError)) == openjson.toJson(obj)

  test "round-trips PtyTicketConnectToken":
    let obj = newPtyTicketConnectToken()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PtyTicketConnectToken)) == openjson.toJson(obj)

  test "round-trips EffectHttpApiErrorForbidden":
    let obj = newEffectHttpApiErrorForbidden()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.EffectHttpApiErrorForbidden)) == openjson.toJson(obj)

  test "round-trips BadRequestError":
    let obj = newBadRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.BadRequestError)) == openjson.toJson(obj)

  test "round-trips PtyNotFoundError":
    let obj = newPtyNotFoundError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PtyNotFoundError)) == openjson.toJson(obj)

  test "round-trips InvalidRequestError":
    let obj = newInvalidRequestError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.InvalidRequestError)) == openjson.toJson(obj)

  test "round-trips Pty":
    let obj = newPty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.Pty)) == openjson.toJson(obj)

  test "round-trips PtyForbiddenError":
    let obj = newPtyForbiddenError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PtyForbiddenError)) == openjson.toJson(obj)

  test "round-trips GetApiPtyResponse":
    let obj = opencode.GetApiPtyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiPtyResponse)) == openjson.toJson(obj)

  test "round-trips PostApiPtyResponse":
    let obj = opencode.PostApiPtyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiPtyResponse)) == openjson.toJson(obj)

  test "round-trips GetApiPtyPtyIDResponse":
    let obj = opencode.GetApiPtyPtyIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.GetApiPtyPtyIDResponse)) == openjson.toJson(obj)

  test "round-trips PutApiPtyPtyIDResponse":
    let obj = opencode.PutApiPtyPtyIDResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PutApiPtyPtyIDResponse)) == openjson.toJson(obj)

  test "round-trips PostApiPtyPtyIDConnectTokenResponse":
    let obj = opencode.PostApiPtyPtyIDConnectTokenResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), opencode.PostApiPtyPtyIDConnectTokenResponse)) == openjson.toJson(obj)

suite "pty endpoints":
  test "GET /pty/shells":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPtyShells("test", "test")

  test "GET /pty":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPty("test", "test")

  test "GET /pty/{ptyID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPtyPtyID("test", "test", "test")

  test "DELETE /pty/{ptyID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deletePtyPtyID("test", "test", "test")

  test "POST /pty/{ptyID}/connect-token":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postPtyPtyIDConnectToken("test", "test", "test")

  test "GET /api/pty":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiPty(openjson.newJObject())

  test "GET /api/pty/{ptyID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiPtyPtyID("test", openjson.newJObject())

  test "DELETE /api/pty/{ptyID}":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteApiPtyPtyID("test", openjson.newJObject())

  test "POST /api/pty/{ptyID}/connect-token":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postApiPtyPtyIDConnectToken("test", openjson.newJObject())

  test "GET /api/pty/{ptyID}/connect":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getApiPtyPtyIDConnect("test", "test", "test", "test", "test")

  test "GET /pty/{ptyID}/connect":
    let client = initOpencodeClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getPtyPtyIDConnect("test", "test", "test", "test", "test")

