# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options]
import ./private/metaclient
import ./private/types

type
  PostExperimentalControlPlaneMoveSessionRequest = object
    session_i_d: string
    destination: types.MoveSessionDestination
    move_changes: Option[bool]

proc postExperimentalControlPlaneMoveSession*(client: OpencodeClient,
                                              body: PostExperimentalControlPlaneMoveSessionRequest): Future[AsyncResponse] {.async.} =
  ## Move a session to another project directory, optionally transferring local
  ## changes.

  let res = await client.httpPOST("/experimental/control-plane/move-session", body)
  return res
