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

type
  GetApiReferenceResponse* = object
    location: LocationInfo
    data: seq[ReferenceInfo]

proc getApiReference*(client: OpencodeClient,
                      location: JsonNode = default(JsonNode)): Future[GetApiReferenceResponse] {.async.} =
  ## List references available in the requested location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/reference", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiReferenceResponse)
  else:
    raise newException(OpencodeClientError, body)
