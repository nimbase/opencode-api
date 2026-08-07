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
  GetExperimentalConsoleOrgsResponse* = object
    ## Switchable Console orgs
    orgs: seq[JsonNode]
  ExperimentalConsoleSwitchRequest = object
    account_i_d: string
    org_i_d: string

proc getExperimentalCapabilities*(client: OpencodeClient,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[ExperimentalCapabilities] {.async.} =
  ## Get experimental features enabled on the OpenCode server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/capabilities", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ExperimentalCapabilities)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalConsole*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[ConsoleState] {.async.} =
  ## Get the active Console org name and the set of provider IDs managed by that
  ## Console org.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/console", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ConsoleState)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalConsoleOrgs*(client: OpencodeClient,
                                 directory: string = default(string),
                                 workspace: string = default(string)): Future[GetExperimentalConsoleOrgsResponse] {.async.} =
  ## Get the available Console orgs across logged-in accounts, including the current
  ## active org.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/console/orgs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalConsoleOrgsResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalConsoleSwitch*(client: OpencodeClient,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: ExperimentalConsoleSwitchRequest): Future[PostExperimentalConsoleSwitchResponse] {.async.} =
  ## Persist a new active Console account/org selection for the current local
  ## OpenCode state.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/console/switch", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostExperimentalConsoleSwitchResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalTool*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string), provider: string,
                          model: string): Future[ToolList] {.async.} =
  ## Get a list of available tools with their JSON schema parameters for a specific
  ## provider and model combination.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["provider"] = $provider
  q["model"] = $model
  let res = await client.httpGET("/experimental/tool", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ToolList)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalToolIds*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[ToolIDs] {.async.} =
  ## Get a list of all available tool IDs, including both built-in tools and
  ## dynamically registered tools.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/tool/ids", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ToolIDs)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalWorktree*(client: OpencodeClient,
                              directory: string = default(string),
                              workspace: string = default(string)): Future[GetExperimentalWorktreeResponse] {.async.} =
  ## List all sandbox worktrees for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalWorktreeResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorktree*(client: OpencodeClient,
                               directory: string = default(string),
                               workspace: string = default(string),
                               body: WorktreeCreateInput): Future[Worktree] {.async.} =
  ## Create a new git worktree for the current project and run any configured startup
  ## scripts.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Worktree)
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalWorktree*(client: OpencodeClient,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 body: WorktreeRemoveInput): Future[DeleteExperimentalWorktreeResponse] {.async.} =
  ## Remove a git worktree and delete its branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteExperimentalWorktreeResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorktreeReset*(client: OpencodeClient,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: WorktreeResetInput): Future[PostExperimentalWorktreeResetResponse] {.async.} =
  ## Reset a worktree branch to the primary default branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/worktree/reset", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostExperimentalWorktreeResetResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalSession*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string),
                             roots: JsonNode = default(JsonNode),
                             start: float64 = default(float64),
                             cursor: float64 = default(float64),
                             search: string = default(string),
                             limit: float64 = default(float64),
                             archived: JsonNode = default(JsonNode)): Future[GetExperimentalSessionResponse] {.async.} =
  ## Get a list of all OpenCode sessions across projects, sorted by most recently
  ## updated. Archived sessions are excluded by default.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["roots"] = $roots
  q["start"] = $start
  q["cursor"] = $cursor
  q["search"] = $search
  q["limit"] = $limit
  q["archived"] = $archived
  let res = await client.httpGET("/experimental/session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalSessionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalSessionSessionIDBackground*(client: OpencodeClient,
                                                 sessionID: string,
                                                 directory: string = default(string),
                                                 workspace: string = default(string)): Future[PostExperimentalSessionSessionIDBackgroundResponse] {.async.} =
  ## Detach any synchronous subagents currently blocking the session and continue
  ## them in the background.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/experimental/session/{sessionID}/background", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostExperimentalSessionSessionIDBackgroundResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalResource*(client: OpencodeClient,
                              directory: string = default(string),
                              workspace: string = default(string)): Future[GetExperimentalResourceResponse] {.async.} =
  ## Get all available MCP resources from connected servers. Optionally filter by
  ## name.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/resource", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetExperimentalResourceResponse)
  else:
    raise newException(OpencodeClientError, body)
