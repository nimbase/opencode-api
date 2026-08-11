# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostExperimentalWorkspaceRequest = object
    id: Option[string]
    `type`: string
    branch: Option[JsonNode]
    extra: Option[JsonNode]
  PostExperimentalWorkspaceWarpRequest = object
    id: JsonNode
    session_i_d: string
    copy_changes: Option[bool]

proc getExperimentalWorkspaceAdapter*(client: OpencodeClient,
                                      directory: string = default(string),
                                      workspace: string = default(string)): Future[seq[JsonNode]] {.async.} =
  ## List all available workspace adapters for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace/adapter", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalWorkspace*(client: OpencodeClient,
                               directory: string = default(string),
                               workspace: string = default(string)): Future[seq[types.Workspace]] {.async.} =
  ## List all workspaces.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.Workspace])
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorkspace*(client: OpencodeClient,
                                directory: string = default(string),
                                workspace: string = default(string),
                                body: PostExperimentalWorkspaceRequest): Future[types.Workspace] {.async.} =
  ## Create a workspace for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/workspace", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Workspace)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorkspaceSyncList*(client: OpencodeClient,
                                        directory: string = default(string),
                                        workspace: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Register missing workspaces returned by workspace adapters.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/workspace/sync-list", q)
  return res

proc getExperimentalWorkspaceStatus*(client: OpencodeClient,
                                     directory: string = default(string),
                                     workspace: string = default(string)): Future[seq[types.WorkspaceEventConnectionStatus]] {.async.} =
  ## Get connection status for workspaces in the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace/status", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.WorkspaceEventConnectionStatus])
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalWorkspaceId*(client: OpencodeClient, id: string,
                                    directory: string = default(string),
                                    workspace: string = default(string)): Future[types.Workspace] {.async.} =
  ## Remove an existing workspace.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/experimental/workspace/{id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Workspace)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorkspaceWarp*(client: OpencodeClient,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: PostExperimentalWorkspaceWarpRequest): Future[AsyncResponse] {.async.} =
  ## Move a session's sync history into the target workspace, or detach it to the
  ## local project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/workspace/warp", q)
  return res
