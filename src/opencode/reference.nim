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
  GetApiReferenceResponse* = object
    location: types.LocationInfo
    data: seq[types.ReferenceInfo]

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
