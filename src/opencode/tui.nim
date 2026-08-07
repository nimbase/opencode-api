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
  TuiAppendPromptRequest = object
    text: string
  TuiExecuteCommandRequest = object
    command: string
  TuiShowToastRequest = object
    title: Option[string]
    message: string
    variant: string
    duration: Option[int64]
  TuiSelectSessionRequest = object
    session_i_d: string
  GetTuiControlNextResponse* = object
    ## Next TUI request
    path: string
    body: JsonNode

proc postTuiAppendPrompt*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string),
                          body: TuiAppendPromptRequest): Future[PostTuiAppendPromptResponse] {.async.} =
  ## Append prompt to the TUI.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/append-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiAppendPromptResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenHelp*(client: OpencodeClient,
                      directory: string = default(string),
                      workspace: string = default(string)): Future[PostTuiOpenHelpResponse] {.async.} =
  ## Open the help dialog in the TUI to display user assistance information.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-help", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiOpenHelpResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenSessions*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[PostTuiOpenSessionsResponse] {.async.} =
  ## Open the session dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-sessions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiOpenSessionsResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenThemes*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[PostTuiOpenThemesResponse] {.async.} =
  ## Open the theme dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-themes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiOpenThemesResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiOpenModels*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[PostTuiOpenModelsResponse] {.async.} =
  ## Open the model dialog.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/open-models", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiOpenModelsResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiSubmitPrompt*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[PostTuiSubmitPromptResponse] {.async.} =
  ## Submit the prompt.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/submit-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiSubmitPromptResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiClearPrompt*(client: OpencodeClient,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[PostTuiClearPromptResponse] {.async.} =
  ## Clear the prompt.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/clear-prompt", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiClearPromptResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiExecuteCommand*(client: OpencodeClient,
                            directory: string = default(string),
                            workspace: string = default(string),
                            body: TuiExecuteCommandRequest): Future[PostTuiExecuteCommandResponse] {.async.} =
  ## Execute a TUI command.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/execute-command", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiExecuteCommandResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiShowToast*(client: OpencodeClient,
                       directory: string = default(string),
                       workspace: string = default(string),
                       body: TuiShowToastRequest): Future[PostTuiShowToastResponse] {.async.} =
  ## Show a toast notification in the TUI.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/show-toast", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiShowToastResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiPublish*(client: OpencodeClient, directory: string = default(string),
                     workspace: string = default(string)): Future[PostTuiPublishResponse] {.async.} =
  ## Publish a TUI event.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/publish", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiPublishResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postTuiSelectSession*(client: OpencodeClient,
                           directory: string = default(string),
                           workspace: string = default(string),
                           body: TuiSelectSessionRequest): Future[PostTuiSelectSessionResponse] {.async.} =
  ## Navigate the TUI to display the specified session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/select-session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiSelectSessionResponse)
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
                             workspace: string = default(string)): Future[PostTuiControlResponseResponse] {.async.} =
  ## Submit a response to the TUI request queue to complete a pending request.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/tui/control/response", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostTuiControlResponseResponse)
  else:
    raise newException(OpencodeClientError, body)
