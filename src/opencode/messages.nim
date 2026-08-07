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
  MessageOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc getApiSessionSessionIDMessage*(client: OpencodeClient, sessionID: string,
                                    limit: float64 = default(float64),
                                    order: set[MessageOrderOption] = {},
                                    cursor: string = default(string)): Future[SessionMessagesResponse] {.async.} =
  ## Retrieve projected messages for a session. Items keep the requested order across
  ## pages; use cursor.next or cursor.previous to move through the ordered timeline.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in order: q["order"] = $v
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/api/session/{sessionID}/message", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, SessionMessagesResponse)
  else:
    raise newException(OpencodeClientError, body)
