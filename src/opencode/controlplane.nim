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
  ExperimentalControlPlaneMoveSessionRequest = object
    session_i_d: string
    destination: MoveSessionDestination
    move_changes: Option[bool]

proc postExperimentalControlPlaneMoveSession*(client: OpencodeClient,
                                              body: ExperimentalControlPlaneMoveSessionRequest): Future[AsyncResponse] {.async.} =
  ## Move a session to another project directory, optionally transferring local
  ## changes.

  let res = await client.httpPOST("/experimental/control-plane/move-session", body)
  return res
