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
  SyncReplayRequest = object
    directory: string
    events: seq[JsonNode]
  PostSyncReplayResponse* = object
    ## Replayed sync events
    session_i_d: string
  SyncStealRequest = object
    session_i_d: string
  PostSyncStealResponse* = object
    ## Session stolen into workspace
    session_i_d: string

proc postSyncStart*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[PostSyncStartResponse] {.async.} =
  ## Start sync loops for workspaces in the current project that have active
  ## sessions.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/sync/start", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSyncStartResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSyncReplay*(client: OpencodeClient, directory: string = default(string),
                     workspace: string = default(string),
                     body: SyncReplayRequest): Future[PostSyncReplayResponse] {.async.} =
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
                    workspace: string = default(string), body: SyncStealRequest): Future[PostSyncStealResponse] {.async.} =
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
                      workspace: string = default(string)): Future[PostSyncHistoryResponse] {.async.} =
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
    result = fromJson(body, PostSyncHistoryResponse)
  else:
    raise newException(OpencodeClientError, body)
