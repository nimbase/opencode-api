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
  VcsApplyRequest = object
    patch: string
  PostVcsApplyResponse* = object
    ## VCS patch applied
    applied: bool
  InstanceModeOption* = enum
    modeGit = "git"
    modeBranch = "branch"


proc postInstanceDispose*(client: OpencodeClient,
                          directory: string = default(string),
                          workspace: string = default(string)): Future[PostInstanceDisposeResponse] {.async.} =
  ## Clean up and dispose the current OpenCode instance, releasing all resources.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/instance/dispose", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostInstanceDisposeResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getPath*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string)): Future[Path] {.async.} =
  ## Retrieve the current working directory and related path information for the
  ## OpenCode instance.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/path", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Path)
  else:
    raise newException(OpencodeClientError, body)

proc getVcs*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[VcsInfo] {.async.} =
  ## Retrieve version control system (VCS) information for the current project, such
  ## as git branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/vcs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, VcsInfo)
  else:
    raise newException(OpencodeClientError, body)

proc getVcsStatus*(client: OpencodeClient, directory: string = default(string),
                   workspace: string = default(string)): Future[GetVcsStatusResponse] {.async.} =
  ## Retrieve changed files in the current working tree without patches.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/vcs/status", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetVcsStatusResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getVcsDiff*(client: OpencodeClient, directory: string = default(string),
                 workspace: string = default(string),
                 mode: set[InstanceModeOption] = {},
                 context: int64 = default(int64)): Future[GetVcsDiffResponse] {.async.} =
  ## Retrieve the current git diff for the working tree or against the default
  ## branch.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  for v in mode: q["mode"] = $v
  q["context"] = $context
  let res = await client.httpGET("/vcs/diff", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetVcsDiffResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getVcsDiffRaw*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Retrieve a raw patch for current uncommitted changes.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/vcs/diff/raw", q)
  return res

proc postVcsApply*(client: OpencodeClient, directory: string = default(string),
                   workspace: string = default(string), body: VcsApplyRequest): Future[PostVcsApplyResponse] {.async.} =
  ## Apply a raw patch to the current working tree.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/vcs/apply", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostVcsApplyResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getCommand*(client: OpencodeClient, directory: string = default(string),
                 workspace: string = default(string)): Future[GetCommandResponse] {.async.} =
  ## Get a list of all available commands in the OpenCode system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/command", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetCommandResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getAgent*(client: OpencodeClient, directory: string = default(string),
               workspace: string = default(string)): Future[GetAgentResponse] {.async.} =
  ## Get a list of all available AI agents in the OpenCode system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/agent", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAgentResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getSkill*(client: OpencodeClient, directory: string = default(string),
               workspace: string = default(string)): Future[GetSkillResponse] {.async.} =
  ## Get a list of all available skills in the OpenCode system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/skill", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetSkillResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getLsp*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[GetLspResponse] {.async.} =
  ## Get LSP server status

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/lsp", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetLspResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getFormatter*(client: OpencodeClient, directory: string = default(string),
                   workspace: string = default(string)): Future[GetFormatterResponse] {.async.} =
  ## Get formatter status

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/formatter", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetFormatterResponse)
  else:
    raise newException(OpencodeClientError, body)
