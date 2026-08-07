# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Clue CLI Assistant https://github.com/openpeeps/clue
#
# Generated at: 2026-08-07T13:12:58+03:00
# License: MIT
import std/[strformat, options, json]
import ./metaclient
import ./types

type
  GetApiCommandResponse* = object
    location: LocationInfo
    data: seq[CommandV2Info]

proc getApiCommand*(client: OpencodeClient,
                    location: JsonNode = default(JsonNode)): Future[GetApiCommandResponse] {.async.} =
  ## Retrieve currently registered commands.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/command", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiCommandResponse)
  else:
    raise newException(OpencodeClientError, body)
