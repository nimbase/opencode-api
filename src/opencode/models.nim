# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types

type
  GetApiModelResponse* = object
    location: types.LocationInfo
    data: seq[types.ModelV2Info]

proc getApiModel*(client: OpencodeClient, location: JsonNode = default(JsonNode)): Future[GetApiModelResponse] {.async.} =
  ## Retrieve available models ordered by release date.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/model", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiModelResponse)
  else:
    raise newException(OpencodeClientError, body)
