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
  PostMcpRequest = object
    name: string
    config: JsonNode
  PostMcpNameAuthResponse* = object
    ## OAuth flow started
    authorization_url: string
    oauth_state: string
  DeleteMcpNameAuthResponse* = object
    ## OAuth credentials removed
    success: bool
  PostMcpNameAuthCallbackRequest = object
    code: string

proc getMcp*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[JsonNode] {.async.} =
  ## Get the status of all Model Context Protocol (MCP) servers.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/mcp", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(OpencodeClientError, body)

proc postMcp*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: PostMcpRequest): Future[JsonNode] {.async.} =
  ## Dynamically add a new Model Context Protocol (MCP) server to the system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/mcp", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameAuth*(client: OpencodeClient, name: string,
                      directory: string = default(string),
                      workspace: string = default(string)): Future[PostMcpNameAuthResponse] {.async.} =
  ## Start OAuth authentication flow for a Model Context Protocol (MCP) server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/auth", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostMcpNameAuthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteMcpNameAuth*(client: OpencodeClient, name: string,
                        directory: string = default(string),
                        workspace: string = default(string)): Future[DeleteMcpNameAuthResponse] {.async.} =
  ## Remove OAuth credentials for an MCP server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/mcp/{name}/auth", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteMcpNameAuthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameAuthCallback*(client: OpencodeClient, name: string,
                              directory: string = default(string),
                              workspace: string = default(string),
                              body: PostMcpNameAuthCallbackRequest): Future[types.MCPStatus] {.async.} =
  ## Complete OAuth authentication for a Model Context Protocol (MCP) server using
  ## the authorization code.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/auth/callback", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MCPStatus)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameAuthAuthenticate*(client: OpencodeClient, name: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[types.MCPStatus] {.async.} =
  ## Start OAuth flow and wait for callback (opens browser).

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/auth/authenticate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MCPStatus)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameConnect*(client: OpencodeClient, name: string,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[bool] {.async.} =
  ## Connect an MCP server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/connect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameDisconnect*(client: OpencodeClient, name: string,
                            directory: string = default(string),
                            workspace: string = default(string)): Future[bool] {.async.} =
  ## Disconnect an MCP server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/disconnect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
