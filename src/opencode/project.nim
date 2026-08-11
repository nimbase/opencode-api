# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PatchProjectProjectIDRequest = object
    name: Option[string]
    icon: Option[types.ProjectIcon]
    commands: Option[types.ProjectCommands]

proc getProject*(client: OpencodeClient, directory: string = default(string),
                 workspace: string = default(string)): Future[seq[types.Project]] {.async.} =
  ## Get a list of projects that have been opened with OpenCode.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/project", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.Project])
  else:
    raise newException(OpencodeClientError, body)

proc getProjectCurrent*(client: OpencodeClient,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[types.Project] {.async.} =
  ## Retrieve the currently active project that OpenCode is working with.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/project/current", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Project)
  else:
    raise newException(OpencodeClientError, body)

proc postProjectGitInit*(client: OpencodeClient,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[types.Project] {.async.} =
  ## Create a git repository for the current project and return the refreshed project
  ## info.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/project/git/init", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Project)
  else:
    raise newException(OpencodeClientError, body)

proc patchProjectProjectID*(client: OpencodeClient, projectID: string,
                            directory: string = default(string),
                            workspace: string = default(string),
                            body: PatchProjectProjectIDRequest): Future[types.Project] {.async.} =
  ## Update project properties such as name, icon, and commands.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPATCH(fmt"/project/{projectID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Project)
  else:
    raise newException(OpencodeClientError, body)

proc getProjectProjectIDDirectories*(client: OpencodeClient, projectID: string,
                                     directory: string = default(string),
                                     workspace: string = default(string)): Future[types.ProjectDirectories] {.async.} =
  ## List known local absolute directories for a project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/project/{projectID}/directories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ProjectDirectories)
  else:
    raise newException(OpencodeClientError, body)
