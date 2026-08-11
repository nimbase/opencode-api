# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient


proc getApiEvent*(client: OpencodeClient): Future[AsyncResponse] {.async.} =
  ## Subscribe to native event payloads for the server.

  let res = await client.httpGET("/api/event")
  return res
