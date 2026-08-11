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
  GetApiSkillResponse* = object
    location: types.LocationInfo
    data: seq[types.SkillV2Info]

proc getApiSkill*(client: OpencodeClient, location: JsonNode = default(JsonNode)): Future[GetApiSkillResponse] {.async.} =
  ## Retrieve currently registered skills.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/skill", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiSkillResponse)
  else:
    raise newException(OpencodeClientError, body)
