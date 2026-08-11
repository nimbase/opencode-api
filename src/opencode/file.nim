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
  FileDirsOption* = enum
    dirsTrue = "true"
    dirsFalse = "false"

  FileTypeOption* = enum
    typeFile = "file"
    typeDirectory = "directory"


proc getFind*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), pattern: string): Future[seq[JsonNode]] {.async.} =
  ## Search for text patterns across files in the project using ripgrep.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["pattern"] = $pattern
  let res = await client.httpGET("/find", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(OpencodeClientError, body)

proc getFindFile*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string), query: string,
                  dirs: set[FileDirsOption] = {},
                  `type`: set[FileTypeOption] = {},
                  limit: int64 = default(int64)): Future[seq[string]] {.async.} =
  ## Search for files or directories by name or pattern in the project directory.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["query"] = $query
  for v in dirs: q["dirs"] = $v
  for v in `type`: q["type"] = $v
  q["limit"] = $limit
  let res = await client.httpGET("/find/file", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[string])
  else:
    raise newException(OpencodeClientError, body)

proc getFindSymbol*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string), query: string): Future[seq[types.Symbol]] {.async.} =
  ## Search for workspace symbols like functions, classes, and variables using LSP.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["query"] = $query
  let res = await client.httpGET("/find/symbol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.Symbol])
  else:
    raise newException(OpencodeClientError, body)

proc getFile*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), path: string): Future[seq[types.FileNode]] {.async.} =
  ## List files and directories in a specified path.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["path"] = $path
  let res = await client.httpGET("/file", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.FileNode])
  else:
    raise newException(OpencodeClientError, body)

proc getFileContent*(client: OpencodeClient, directory: string = default(string),
                     workspace: string = default(string), path: string): Future[types.FileContent] {.async.} =
  ## Read the content of a specified file.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["path"] = $path
  let res = await client.httpGET("/file/content", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FileContent)
  else:
    raise newException(OpencodeClientError, body)

proc getFileStatus*(client: OpencodeClient, directory: string = default(string),
                    workspace: string = default(string)): Future[seq[types.File]] {.async.} =
  ## Get the git status of all files in the project.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/file/status", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.File])
  else:
    raise newException(OpencodeClientError, body)
