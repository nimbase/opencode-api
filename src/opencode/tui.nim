# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient

type
  PostTuiAppendPromptRequest = object
    text: string
  PostTuiExecuteCommandRequest = object
    command: string
  PostTuiShowToastRequest = object
    title: Option[string]
    message: string
    variant: string
    duration: Option[int64]
  PostTuiSelectSessionRequest = object
    session_i_d: string
  GetTuiControlNextResponse* = object
    ## Next TUI request
    path: string
    body: JsonNode

proc postTuiAppendPrompt*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string),
                          body: PostTuiAppendPromptRequest): Future[bool] {.async.} =
  ## Append prompt to the TUI.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/append-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenHelp*(client: OpencodeClient,
                      directory: string = default(string),
                      workspace: string = default(string)): Future[bool] {.async.} =
  ## Open the help dialog in the TUI to display user assistance information.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-help", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenSessions*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[bool] {.async.} =
  ## Open the session dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-sessions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenThemes*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[bool] {.async.} =
  ## Open the theme dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-themes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenModels*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[bool] {.async.} =
  ## Open the model dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-models", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiSubmitPrompt*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[bool] {.async.} =
  ## Submit the prompt.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/submit-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiClearPrompt*(client: OpencodeClient,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[bool] {.async.} =
  ## Clear the prompt.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/clear-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiExecuteCommand*(client: OpencodeClient,
                            directory: string = default(string),
                            workspace: string = default(string),
                            body: PostTuiExecuteCommandRequest): Future[bool] {.async.} =
  ## Execute a TUI command.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/execute-command", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiShowToast*(client: OpencodeClient,
                       directory: string = default(string),
                       workspace: string = default(string),
                       body: PostTuiShowToastRequest): Future[bool] {.async.} =
  ## Show a toast notification in the TUI.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/show-toast", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiPublish*(client: OpencodeClient, directory: string = default(string),
                     workspace: string = default(string)): Future[bool] {.async.} =
  ## Publish a TUI event.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/publish", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiSelectSession*(client: OpencodeClient,
                           directory: string = default(string),
                           workspace: string = default(string),
                           body: PostTuiSelectSessionRequest): Future[bool] {.async.} =
  ## Navigate the TUI to display the specified session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/select-session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc getTuiControlNext*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[GetTuiControlNextResponse] {.async.} =
  ## Retrieve the next TUI request from the queue for processing.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/tui/control/next", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTuiControlNextResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiControlResponse*(client: OpencodeClient,
                             directory: string = default(string),
                             workspace: string = default(string)): Future[bool] {.async.} =
  ## Submit a response to the TUI request queue to complete a pending request.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/control/response", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
