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
  GetApiCommandResponse* = object
    location: types.LocationInfo
    data: seq[types.CommandV2Info]

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
