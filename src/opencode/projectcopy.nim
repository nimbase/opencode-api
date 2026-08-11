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
  PostExperimentalProjectProjectIDCopyGenerateNameRequest = object
    context: Option[string]
  PostExperimentalProjectProjectIDCopyGenerateNameResponse* = object
    name: string
  PostExperimentalProjectProjectIDCopyRequest = object
    strategy: string
    directory: string
    name: Option[string]
  DeleteExperimentalProjectProjectIDCopyRequest = object
    directory: string
    force: bool

proc postExperimentalProjectProjectIDCopyGenerateName*(client: OpencodeClient,
                                                       projectID: string,
                                                       directory: string = default(string),
                                                       workspace: string = default(string),
                                                       body: PostExperimentalProjectProjectIDCopyGenerateNameRequest): Future[PostExperimentalProjectProjectIDCopyGenerateNameResponse] {.async.} =
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
                                           body: PostExperimentalProjectProjectIDCopyRequest): Future[types.ProjectCopyCopy] {.async.} =
  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/experimental/project/{projectID}/copy", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ProjectCopyCopy)
  else:
    raise newException(OpencodeClientError, body)

proc deleteExperimentalProjectProjectIDCopy*(client: OpencodeClient,
                                             projectID: string,
                                             location: JsonNode = default(JsonNode),
                                             body: DeleteExperimentalProjectProjectIDCopyRequest): Future[AsyncResponse] {.async.} =
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
