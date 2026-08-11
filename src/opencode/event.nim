# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient


proc getEvent*(client: OpencodeClient, directory: string = default(string),
               workspace: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Get events

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/event", q)
  return res
