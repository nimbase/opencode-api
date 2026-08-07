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
  GetApiSkillResponse* = object
    location: LocationInfo
    data: seq[SkillV2Info]

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
