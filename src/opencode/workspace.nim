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
  ExperimentalWorkspaceRequest = object
    id: Option[string]
    `type`: string
    branch: Option[JsonNode]
    extra: Option[JsonNode]
  ExperimentalWorkspaceWarpRequest = object
    id: JsonNode
    session_i_d: string
    copy_changes: Option[bool]

proc getExperimentalWorkspaceAdapter*(client: OpencodeClient,
                                      directory: string = default(string),
                                      workspace: string = default(string)): Future[GetExperimentalWorkspaceAdapterResponse] {.async.} =
  ## List all available workspace adapters for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace/adapter", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalWorkspaceAdapterResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalWorkspace*(client: OpencodeClient,
                               directory: string = default(string),
                               workspace: string = default(string)): Future[GetExperimentalWorkspaceResponse] {.async.} =
  ## List all workspaces.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalWorkspaceResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorkspace*(client: OpencodeClient,
                                directory: string = default(string),
                                workspace: string = default(string),
                                body: ExperimentalWorkspaceRequest): Future[Workspace] {.async.} =
  ## Create a workspace for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/workspace", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Workspace)
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
                                     workspace: string = default(string)): Future[GetExperimentalWorkspaceStatusResponse] {.async.} =
  ## Get connection status for workspaces in the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/workspace/status", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalWorkspaceStatusResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalWorkspaceId*(client: OpencodeClient, id: string,
                                    directory: string = default(string),
                                    workspace: string = default(string)): Future[Workspace] {.async.} =
  ## Remove an existing workspace.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/experimental/workspace/{id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Workspace)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorkspaceWarp*(client: OpencodeClient,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: ExperimentalWorkspaceWarpRequest): Future[AsyncResponse] {.async.} =
  ## Move a session's sync history into the target workspace, or detach it to the
  ## local project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/workspace/warp", q)
  return res
