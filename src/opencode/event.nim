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


proc getEvent*(client: OpencodeClient, directory: string = default(string),
               workspace: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Get events

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/event", q)
  return res
