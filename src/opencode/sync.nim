# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  PostSyncReplayRequest = object
    directory: string
    events: seq[JsonNode]
  PostSyncReplayResponse* = object
    ## Replayed sync events
    session_i_d: string
  PostSyncStealRequest = object
    session_i_d: string
  PostSyncStealResponse* = object
    ## Session stolen into workspace
    session_i_d: string

proc postSyncStart*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[bool] {.async.} =
  ## Start sync loops for workspaces in the current project that have active
  ## sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/sync/start", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postSyncReplay*(client: OpencodeClient, directory: string = default(string),
                     workspace: string = default(string),
                     body: PostSyncReplayRequest): Future[PostSyncReplayResponse] {.async.} =
  ## Validate and replay a complete sync event history.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/sync/replay", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSyncReplayResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSyncSteal*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string),
                    body: PostSyncStealRequest): Future[PostSyncStealResponse] {.async.} =
  ## Update a session to belong to the current workspace through the sync event
  ## system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/sync/steal", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSyncStealResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSyncHistory*(client: OpencodeClient,
                      directory: string = default(string),
                      workspace: string = default(string)): Future[seq[JsonNode]] {.async.} =
  ## List sync events for all aggregates. Keys are aggregate IDs the client already
  ## knows about, values are the last known sequence ID. Events with seq > value are
  ## returned for those aggregates. Aggregates not listed in the input get their full
  ## history.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/sync/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(OpencodeClientError, body)
