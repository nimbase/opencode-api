# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetExperimentalConsoleOrgsResponse* = object
    ## Switchable Console orgs
    orgs: seq[JsonNode]
  PostExperimentalConsoleSwitchRequest = object
    account_i_d: string
    org_i_d: string

proc getExperimentalCapabilities*(client: OpencodeClient,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[types.ExperimentalCapabilities] {.async.} =
  ## Get experimental features enabled on the OpenCode server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/capabilities", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ExperimentalCapabilities)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalConsole*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[types.ConsoleState] {.async.} =
  ## Get the active Console org name and the set of provider IDs managed by that
  ## Console org.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/console", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ConsoleState)
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
                                    body: PostExperimentalConsoleSwitchRequest): Future[bool] {.async.} =
  ## Persist a new active Console account/org selection for the current local
  ## OpenCode state.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/console/switch", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalTool*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string), provider: string,
                          model: string): Future[types.ToolList] {.async.} =
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
    result = fromJson(body, types.ToolList)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalToolIds*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[types.ToolIDs] {.async.} =
  ## Get a list of all available tool IDs, including both built-in tools and
  ## dynamically registered tools.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/tool/ids", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ToolIDs)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalWorktree*(client: OpencodeClient,
                              directory: string = default(string),
                              workspace: string = default(string)): Future[seq[string]] {.async.} =
  ## List all sandbox worktrees for the current project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[string])
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorktree*(client: OpencodeClient,
                               directory: string = default(string),
                               workspace: string = default(string),
                               body: types.WorktreeCreateInput): Future[types.Worktree] {.async.} =
  ## Create a new git worktree for the current project and run any configured startup
  ## scripts.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Worktree)
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalWorktree*(client: OpencodeClient,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 body: types.WorktreeRemoveInput): Future[bool] {.async.} =
  ## Remove a git worktree and delete its branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE("/experimental/worktree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalWorktreeReset*(client: OpencodeClient,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: types.WorktreeResetInput): Future[bool] {.async.} =
  ## Reset a worktree branch to the primary default branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/experimental/worktree/reset", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
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
                             archived: JsonNode = default(JsonNode)): Future[seq[types.GlobalSession]] {.async.} =
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
    result = fromJson(body, seq[types.GlobalSession])
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalSessionSessionIDBackground*(client: OpencodeClient,
                                                 sessionID: string,
                                                 directory: string = default(string),
                                                 workspace: string = default(string)): Future[bool] {.async.} =
  ## Detach any synchronous subagents currently blocking the session and continue
  ## them in the background.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/experimental/session/{sessionID}/background", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc getExperimentalResource*(client: OpencodeClient,
                              directory: string = default(string),
                              workspace: string = default(string)): Future[JsonNode] {.async.} =
  ## Get all available MCP resources from connected servers. Optionally filter by
  ## name.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/experimental/resource", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(OpencodeClientError, body)
