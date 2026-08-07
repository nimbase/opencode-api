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
  McpRequest = object
    name: string
    config: JsonNode
  PostMcpNameAuthResponse* = object
    ## OAuth flow started
    authorization_url: string
    oauth_state: string
  DeleteMcpNameAuthResponse* = object
    ## OAuth credentials removed
    success: bool
  McpNameAuthCallbackRequest = object
    code: string

proc getMcp*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[GetMcpResponse] {.async.} =
  ## Get the status of all Model Context Protocol (MCP) servers.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/mcp", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetMcpResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postMcp*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: McpRequest): Future[PostMcpResponse] {.async.} =
  ## Dynamically add a new Model Context Protocol (MCP) server to the system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/mcp", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostMcpResponse)
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
                              body: McpNameAuthCallbackRequest): Future[MCPStatus] {.async.} =
  ## Complete OAuth authentication for a Model Context Protocol (MCP) server using
  ## the authorization code.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/auth/callback", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, MCPStatus)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameAuthAuthenticate*(client: OpencodeClient, name: string,
                                  directory: string = default(string),
                                  workspace: string = default(string)): Future[MCPStatus] {.async.} =
  ## Start OAuth flow and wait for callback (opens browser).

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/auth/authenticate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, MCPStatus)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameConnect*(client: OpencodeClient, name: string,
                         directory: string = default(string),
                         workspace: string = default(string)): Future[PostMcpNameConnectResponse] {.async.} =
  ## Connect an MCP server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/connect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostMcpNameConnectResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postMcpNameDisconnect*(client: OpencodeClient, name: string,
                            directory: string = default(string),
                            workspace: string = default(string)): Future[PostMcpNameDisconnectResponse] {.async.} =
  ## Disconnect an MCP server.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/mcp/{name}/disconnect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostMcpNameDisconnectResponse)
  else:
    raise newException(OpencodeClientError, body)
