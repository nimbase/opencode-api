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
  SessionRequest = object
    parent_i_d: Option[string]
    title: Option[string]
    agent: Option[string]
    model: Option[JsonNode]
    metadata: Option[JsonNode]
    permission: Option[PermissionRuleset]
    workspace_i_d: Option[string]
  SessionSessionIDRequest = object
    title: Option[string]
    metadata: Option[JsonNode]
    permission: Option[PermissionRuleset]
    time: Option[JsonNode]
  SessionSessionIDMessageRequest = object
    message_i_d: Option[string]
    model: Option[JsonNode]
    agent: Option[string]
    no_reply: Option[bool]
    tools: Option[JsonNode]
    format: Option[OutputFormat]
    system: Option[string]
    variant: Option[string]
    parts: seq[JsonNode]
  PostSessionSessionIDMessageResponse* = object
    info: AssistantMessage
    parts: seq[Part]
  GetSessionSessionIDMessageMessageIDResponse* = object
    ## Message
    info: Message
    parts: seq[Part]
  SessionSessionIDForkRequest = object
    message_i_d: Option[string]
  SessionSessionIDInitRequest = object
    model_i_d: string
    provider_i_d: string
    message_i_d: string
  SessionSessionIDSummarizeRequest = object
    provider_i_d: string
    model_i_d: string
    auto: Option[bool]
  SessionSessionIDPromptAsyncRequest = object
    message_i_d: Option[string]
    model: Option[JsonNode]
    agent: Option[string]
    no_reply: Option[bool]
    tools: Option[JsonNode]
    format: Option[OutputFormat]
    system: Option[string]
    variant: Option[string]
    parts: seq[JsonNode]
  SessionSessionIDCommandRequest = object
    message_i_d: Option[string]
    agent: Option[string]
    model: Option[string]
    arguments: string
    command: string
    variant: Option[string]
    parts: Option[seq[JsonNode]]
  PostSessionSessionIDCommandResponse* = object
    info: AssistantMessage
    parts: seq[Part]
  SessionSessionIDShellRequest = object
    message_i_d: Option[string]
    agent: string
    model: Option[JsonNode]
    command: string
  PostSessionSessionIDShellResponse* = object
    ## Created message
    info: Message
    parts: seq[Part]
  SessionSessionIDRevertRequest = object
    message_i_d: string
    part_i_d: Option[string]
  SessionSessionIDPermissionsPermissionIDRequest = object
    response: string
  SessionScopeOption* = enum
    scopeProject = "project"


proc getSession*(client: OpencodeClient, directory: string = default(string),
                 workspace: string = default(string),
                 scope: set[SessionScopeOption] = {},
                 path: string = default(string),
                 roots: JsonNode = default(JsonNode),
                 start: float64 = default(float64),
                 search: string = default(string),
                 limit: float64 = default(float64)): Future[GetSessionResponse] {.async.} =
  ## Get a list of all OpenCode sessions, sorted by most recently updated.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  for v in scope: q["scope"] = $v
  q["path"] = $path
  q["roots"] = $roots
  q["start"] = $start
  q["search"] = $search
  q["limit"] = $limit
  let res = await client.httpGET("/session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSession*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string), body: SessionRequest): Future[Session] {.async.} =
  ## Create a new OpenCode session for interacting with AI assistants and managing
  ## conversations.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionStatus*(client: OpencodeClient,
                       directory: string = default(string),
                       workspace: string = default(string)): Future[GetSessionStatusResponse] {.async.} =
  ## Retrieve the current status of all sessions, including active, idle, and
  ## completed states.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/session/status", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionStatusResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionID*(client: OpencodeClient, sessionID: string,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[Session] {.async.} =
  ## Retrieve detailed information about a specific OpenCode session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/session/{sessionID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc deleteSessionSessionID*(client: OpencodeClient, sessionID: string,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[DeleteSessionSessionIDResponse] {.async.} =
  ## Delete a session and permanently remove all associated data, including messages
  ## and history.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/session/{sessionID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteSessionSessionIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc patchSessionSessionID*(client: OpencodeClient, sessionID: string,
                            directory: string = default(string),
                            workspace: string = default(string),
                            body: SessionSessionIDRequest): Future[Session] {.async.} =
  ## Update properties of an existing session, such as title or other metadata.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPATCH(fmt"/session/{sessionID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionIDChildren*(client: OpencodeClient, sessionID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[GetSessionSessionIDChildrenResponse] {.async.} =
  ## Retrieve all child sessions that were forked from the specified parent session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/session/{sessionID}/children", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionSessionIDChildrenResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionIDTodo*(client: OpencodeClient, sessionID: string,
                              directory: string = default(string),
                              workspace: string = default(string)): Future[GetSessionSessionIDTodoResponse] {.async.} =
  ## Retrieve the todo list associated with a specific session, showing tasks and
  ## action items.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/session/{sessionID}/todo", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionSessionIDTodoResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionIDDiff*(client: OpencodeClient, sessionID: string,
                              directory: string = default(string),
                              workspace: string = default(string),
                              messageID: string = default(string)): Future[GetSessionSessionIDDiffResponse] {.async.} =
  ## Get the file changes (diff) that resulted from a specific user message in the
  ## session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["messageID"] = $messageID
  let res = await client.httpGET(fmt"/session/{sessionID}/diff", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionSessionIDDiffResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionIDMessage*(client: OpencodeClient, sessionID: string,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 limit: int64 = default(int64),
                                 before: string = default(string)): Future[GetSessionSessionIDMessageResponse] {.async.} =
  ## Retrieve all messages in a session, including user prompts and AI responses.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["limit"] = $limit
  q["before"] = $before
  let res = await client.httpGET(fmt"/session/{sessionID}/message", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionSessionIDMessageResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDMessage*(client: OpencodeClient, sessionID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string),
                                  body: SessionSessionIDMessageRequest): Future[PostSessionSessionIDMessageResponse] {.async.} =
  ## Create and send a new message to a session, streaming the AI response.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/message", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDMessageResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSessionSessionIDMessageMessageID*(client: OpencodeClient,
                                          sessionID: string, messageID: string,
                                          directory: string = default(string),
                                          workspace: string = default(string)): Future[GetSessionSessionIDMessageMessageIDResponse] {.async.} =
  ## Retrieve a specific message from a session by its message ID.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/session/{sessionID}/message/{messageID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSessionSessionIDMessageMessageIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteSessionSessionIDMessageMessageID*(client: OpencodeClient,
                                             sessionID: string,
                                             messageID: string,
                                             directory: string = default(string),
                                             workspace: string = default(string)): Future[DeleteSessionSessionIDMessageMessageIDResponse] {.async.} =
  ## Permanently delete a specific message and all of its parts from a session
  ## without reverting file changes.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/session/{sessionID}/message/{messageID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteSessionSessionIDMessageMessageIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDFork*(client: OpencodeClient, sessionID: string,
                               directory: string = default(string),
                               workspace: string = default(string),
                               body: SessionSessionIDForkRequest): Future[Session] {.async.} =
  ## Create a new session by forking an existing session at a specific message point.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/fork", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDAbort*(client: OpencodeClient, sessionID: string,
                                directory: string = default(string),
                                workspace: string = default(string)): Future[PostSessionSessionIDAbortResponse] {.async.} =
  ## Abort an active session and stop any ongoing AI processing or command execution.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/abort", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDAbortResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDInit*(client: OpencodeClient, sessionID: string,
                               directory: string = default(string),
                               workspace: string = default(string),
                               body: SessionSessionIDInitRequest): Future[PostSessionSessionIDInitResponse] {.async.} =
  ## Analyze the current application and create an AGENTS.md file with
  ## project-specific agent configurations.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/init", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDInitResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDShare*(client: OpencodeClient, sessionID: string,
                                directory: string = default(string),
                                workspace: string = default(string)): Future[Session] {.async.} =
  ## Create a shareable link for a session, allowing others to view the conversation.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/share", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc deleteSessionSessionIDShare*(client: OpencodeClient, sessionID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[Session] {.async.} =
  ## Remove the shareable link for a session, making it private again.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/session/{sessionID}/share", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDSummarize*(client: OpencodeClient, sessionID: string,
                                    directory: string = default(string),
                                    workspace: string = default(string),
                                    body: SessionSessionIDSummarizeRequest): Future[PostSessionSessionIDSummarizeResponse] {.async.} =
  ## Generate a concise summary of the session using AI compaction to preserve key
  ## information.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/summarize", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDSummarizeResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDPromptAsync*(client: OpencodeClient, sessionID: string,
                                      directory: string = default(string),
                                      workspace: string = default(string),
                                      body: SessionSessionIDPromptAsyncRequest): Future[AsyncResponse] {.async.} =
  ## Create and send a new message to a session asynchronously, starting the session
  ## if needed and returning immediately.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/prompt_async", q)
  return res

proc postSessionSessionIDCommand*(client: OpencodeClient, sessionID: string,
                                  directory: string = default(string),
                                  workspace: string = default(string),
                                  body: SessionSessionIDCommandRequest): Future[PostSessionSessionIDCommandResponse] {.async.} =
  ## Send a new command to a session for execution by the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/command", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDCommandResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDShell*(client: OpencodeClient, sessionID: string,
                                directory: string = default(string),
                                workspace: string = default(string),
                                body: SessionSessionIDShellRequest): Future[PostSessionSessionIDShellResponse] {.async.} =
  ## Execute a shell command within the session context and return the AI's response.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/shell", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDShellResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDRevert*(client: OpencodeClient, sessionID: string,
                                 directory: string = default(string),
                                 workspace: string = default(string),
                                 body: SessionSessionIDRevertRequest): Future[Session] {.async.} =
  ## Revert a specific message in a session, undoing its effects and restoring the
  ## previous state.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/revert", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDUnrevert*(client: OpencodeClient, sessionID: string,
                                   directory: string = default(string),
                                   workspace: string = default(string)): Future[Session] {.async.} =
  ## Restore all previously reverted messages in a session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/unrevert", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Session)
  else:
    raise newException(OpencodeClientError, body)

proc postSessionSessionIDPermissionsPermissionID*(client: OpencodeClient,
                                                  sessionID: string,
                                                  permissionID: string,
                                                  directory: string = default(string),
                                                  workspace: string = default(string),
                                                  body: SessionSessionIDPermissionsPermissionIDRequest): Future[PostSessionSessionIDPermissionsPermissionIDResponse] {.async.} =
  ## Approve or deny a permission request from the AI assistant.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/session/{sessionID}/permissions/{permissionID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostSessionSessionIDPermissionsPermissionIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteSessionSessionIDMessageMessageIDPartPartID*(client: OpencodeClient,
                                                       sessionID: string,
                                                       messageID: string,
                                                       partID: string,
                                                       directory: string = default(string),
                                                       workspace: string = default(string)): Future[DeleteSessionSessionIDMessageMessageIDPartPartIDResponse] {.async.} =
  ## Delete a part from a message.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/session/{sessionID}/message/{messageID}/part/{partID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteSessionSessionIDMessageMessageIDPartPartIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc patchSessionSessionIDMessageMessageIDPartPartID*(client: OpencodeClient,
                                                      sessionID: string,
                                                      messageID: string,
                                                      partID: string,
                                                      directory: string = default(string),
                                                      workspace: string = default(string),
                                                      body: Part): Future[Part] {.async.} =
  ## Update a part in a message.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPATCH(fmt"/session/{sessionID}/message/{messageID}/part/{partID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Part)
  else:
    raise newException(OpencodeClientError, body)
