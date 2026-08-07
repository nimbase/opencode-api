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
  PtyRequest = object
    command: Option[string]
    args: Option[seq[string]]
    cwd: Option[string]
    title: Option[string]
    env: Option[JsonNode]
  PtyPtyIDRequest = object
    title: Option[string]
    size: Option[JsonNode]
  GetApiPtyResponse* = object
    location: LocationInfo
    data: seq[Pty]
  ApiPtyRequest = object
    command: Option[string]
    args: Option[seq[string]]
    cwd: Option[string]
    title: Option[string]
    env: Option[JsonNode]
  PostApiPtyResponse* = object
    location: LocationInfo
    data: Pty
  GetApiPtyPtyIDResponse* = object
    location: LocationInfo
    data: Pty
  ApiPtyPtyIDRequest = object
    title: Option[string]
    size: Option[JsonNode]
  PutApiPtyPtyIDResponse* = object
    location: LocationInfo
    data: Pty
  PostApiPtyPtyIDConnectTokenResponse* = object
    location: LocationInfo
    data: PtyTicketConnectToken

proc getPtyShells*(client: OpencodeClient, directory: string = default(string),
                   workspace: string = default(string)): Future[GetPtyShellsResponse] {.async.} =
  ## Get a list of available shells on the system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/pty/shells", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetPtyShellsResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getPty*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[GetPtyResponse] {.async.} =
  ## Get a list of all active pseudo-terminal (PTY) sessions managed by OpenCode.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetPtyResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postPty*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: PtyRequest): Future[Pty] {.async.} =
  ## Create a new pseudo-terminal (PTY) session for running shell commands and
  ## processes.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Pty)
  else:
    raise newException(OpencodeClientError, body)

proc getPtyPtyID*(client: OpencodeClient, ptyID: string,
                  directory: string = default(string),
                  workspace: string = default(string)): Future[Pty] {.async.} =
  ## Retrieve detailed information about a specific pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Pty)
  else:
    raise newException(OpencodeClientError, body)

proc putPtyPtyID*(client: OpencodeClient, ptyID: string,
                  directory: string = default(string),
                  workspace: string = default(string), body: PtyPtyIDRequest): Future[Pty] {.async.} =
  ## Update properties of an existing pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPUT(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, Pty)
  else:
    raise newException(OpencodeClientError, body)

proc deletePtyPtyID*(client: OpencodeClient, ptyID: string,
                     directory: string = default(string),
                     workspace: string = default(string)): Future[DeletePtyPtyIDResponse] {.async.} =
  ## Remove and terminate a specific pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeletePtyPtyIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postPtyPtyIDConnectToken*(client: OpencodeClient, ptyID: string,
                               directory: string = default(string),
                               workspace: string = default(string)): Future[PtyTicketConnectToken] {.async.} =
  ## Create a short-lived ticket for opening a PTY WebSocket connection.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/pty/{ptyID}/connect-token", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PtyTicketConnectToken)
  else:
    raise newException(OpencodeClientError, body)

proc getApiPty*(client: OpencodeClient, location: JsonNode = default(JsonNode)): Future[GetApiPtyResponse] {.async.} =
  ## List PTY sessions for a location, including exited sessions retained until
  ## removal.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiPtyResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiPty*(client: OpencodeClient, location: JsonNode = default(JsonNode),
                 body: ApiPtyRequest): Future[PostApiPtyResponse] {.async.} =
  ## Create a pseudo-terminal session for a location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST("/api/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiPtyResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiPtyPtyID*(client: OpencodeClient, ptyID: string,
                     location: JsonNode = default(JsonNode)): Future[GetApiPtyPtyIDResponse] {.async.} =
  ## Get one PTY session, including its exit code once exited.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET(fmt"/api/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiPtyPtyIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc putApiPtyPtyID*(client: OpencodeClient, ptyID: string,
                     location: JsonNode = default(JsonNode),
                     body: ApiPtyPtyIDRequest): Future[PutApiPtyPtyIDResponse] {.async.} =
  ## Update the title or viewport size of one PTY session.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPUT(fmt"/api/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutApiPtyPtyIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteApiPtyPtyID*(client: OpencodeClient, ptyID: string,
                        location: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  ## Terminate and remove one PTY session.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpDELETE(fmt"/api/pty/{ptyID}", q)
  return res

proc postApiPtyPtyIDConnectToken*(client: OpencodeClient, ptyID: string,
                                  location: JsonNode = default(JsonNode)): Future[PostApiPtyPtyIDConnectTokenResponse] {.async.} =
  ## Create a short-lived single-use ticket for opening a PTY WebSocket connection.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/api/pty/{ptyID}/connect-token", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiPtyPtyIDConnectTokenResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiPtyPtyIDConnect*(client: OpencodeClient, ptyID: string,
                            location[directory]: string = default(string),
                            location[workspace]: string = default(string),
                            cursor: string = default(string),
                            ticket: string = default(string)): Future[GetApiPtyPtyIDConnectResponse] {.async.} =
  ## Establish a WebSocket connection streaming PTY output and accepting terminal
  ## input.

  var q = initOrderedTable[string, string]()
  q["location[directory]"] = $location[directory]
  q["location[workspace]"] = $location[workspace]
  q["cursor"] = $cursor
  q["ticket"] = $ticket
  let res = await client.httpGET(fmt"/api/pty/{ptyID}/connect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiPtyPtyIDConnectResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getPtyPtyIDConnect*(client: OpencodeClient, ptyID: string,
                         directory: string = default(string),
                         workspace: string = default(string),
                         cursor: string = default(string),
                         ticket: string = default(string)): Future[GetPtyPtyIDConnectResponse] {.async.} =
  ## Establish a WebSocket connection to interact with a pseudo-terminal (PTY)
  ## session in real-time.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  q["cursor"] = $cursor
  q["ticket"] = $ticket
  let res = await client.httpGET(fmt"/pty/{ptyID}/connect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetPtyPtyIDConnectResponse)
  else:
    raise newException(OpencodeClientError, body)
