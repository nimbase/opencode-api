# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types

type
  GetApiFsListResponse* = object
    location: types.LocationInfo
    data: seq[types.FileSystemEntry]
  GetApiFsFindResponse* = object
    location: types.LocationInfo
    data: seq[types.FileSystemEntry]
  FilesystemTypeOption* = enum
    typeFile = "file"
    typeDirectory = "directory"


proc getApiFsRead*(client: OpencodeClient,
                   location: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  ## Serve one file relative to the requested location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/fs/read/*", q)
  return res

proc getApiFsList*(client: OpencodeClient,
                   location: JsonNode = default(JsonNode),
                   path: string = default(string)): Future[GetApiFsListResponse] {.async.} =
  ## List direct children of one directory relative to the requested location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  q["path"] = $path
  let res = await client.httpGET("/api/fs/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiFsListResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiFsFind*(client: OpencodeClient,
                   location: JsonNode = default(JsonNode), query: string,
                   `type`: set[FilesystemTypeOption] = {},
                   limit: string = default(string)): Future[GetApiFsFindResponse] {.async.} =
  ## Find recursively ranked filesystem entries relative to the requested location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  q["query"] = $query
  for v in `type`: q["type"] = $v
  q["limit"] = $limit
  let res = await client.httpGET("/api/fs/find", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiFsFindResponse)
  else:
    raise newException(OpencodeClientError, body)
