# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Clue CLI Assistant https://github.com/openpeeps/clue
#
# Generated at: 2026-08-07T13:04:19+03:00
# License: MIT
import std/[strformat, options, json]
import ./metaclient
import ./types


proc getApiEvent*(client: OpencodeClient): Future[AsyncResponse] {.async.} =
  ## Subscribe to native event payloads for the server.

  let res = await client.httpGET("/api/event")
  return res
