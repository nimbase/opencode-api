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
  ExperimentalProjectProjectIDCopyGenerateNameRequest = object
    context: Option[string]
  PostExperimentalProjectProjectIDCopyGenerateNameResponse* = object
    name: string
  ExperimentalProjectProjectIDCopyRequest = object
    strategy: string
    directory: string
    name: Option[string]
  ExperimentalProjectProjectIDCopyRequest = object
    directory: string
    force: bool

proc postExperimentalProjectProjectIDCopyGenerateName*(client: OpencodeClient,
                                                       projectID: string,
                                                       directory: string = default(string),
                                                       workspace: string = default(string),
                                                       body: ExperimentalProjectProjectIDCopyGenerateNameRequest): Future[PostExperimentalProjectProjectIDCopyGenerateNameResponse] {.async.} =
  ## Generate a short name for a project copy from task context.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/experimental/project/{projectID}/copy/generate-name", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostExperimentalProjectProjectIDCopyGenerateNameResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postExperimentalProjectProjectIDCopy*(client: OpencodeClient,
                                           projectID: string,
                                           location: JsonNode = default(JsonNode),
                                           body: ExperimentalProjectProjectIDCopyRequest): Future[ProjectCopyCopy] {.async.} =
  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/experimental/project/{projectID}/copy", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ProjectCopyCopy)
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalProjectProjectIDCopy*(client: OpencodeClient,
                                             projectID: string,
                                             location: JsonNode = default(JsonNode),
                                             body: ExperimentalProjectProjectIDCopyRequest): Future[AsyncResponse] {.async.} =
  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpDELETE(fmt"/experimental/project/{projectID}/copy", q)
  return res

proc postExperimentalProjectProjectIDCopyRefresh*(client: OpencodeClient,
                                                  projectID: string,
                                                  location: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/experimental/project/{projectID}/copy/refresh", q)
  return res
