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
  PostPtyRequest = object
    command: Option[string]
    args: Option[seq[string]]
    cwd: Option[string]
    title: Option[string]
    env: Option[JsonNode]
  PutPtyPtyIDRequest = object
    title: Option[string]
    size: Option[JsonNode]
  GetApiPtyResponse* = object
    location: types.LocationInfo
    data: seq[types.Pty]
  PostApiPtyRequest = object
    command: Option[string]
    args: Option[seq[string]]
    cwd: Option[string]
    title: Option[string]
    env: Option[JsonNode]
  PostApiPtyResponse* = object
    location: types.LocationInfo
    data: types.Pty
  GetApiPtyPtyIDResponse* = object
    location: types.LocationInfo
    data: types.Pty
  PutApiPtyPtyIDRequest = object
    title: Option[string]
    size: Option[JsonNode]
  PutApiPtyPtyIDResponse* = object
    location: types.LocationInfo
    data: types.Pty
  PostApiPtyPtyIDConnectTokenResponse* = object
    location: types.LocationInfo
    data: types.PtyTicketConnectToken

proc getPtyShells*(client: OpencodeClient, directory: string = default(string),
                   workspace: string = default(string)): Future[seq[JsonNode]] {.async.} =
  ## Get a list of available shells on the system.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/pty/shells", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(OpencodeClientError, body)

proc getPty*(client: OpencodeClient, directory: string = default(string),
             workspace: string = default(string)): Future[seq[types.Pty]] {.async.} =
  ## Get a list of all active pseudo-terminal (PTY) sessions managed by OpenCode.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.Pty])
  else:
    raise newException(OpencodeClientError, body)

proc postPty*(client: OpencodeClient, directory: string = default(string),
              workspace: string = default(string), body: PostPtyRequest): Future[types.Pty] {.async.} =
  ## Create a new pseudo-terminal (PTY) session for running shell commands and
  ## processes.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST("/pty", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Pty)
  else:
    raise newException(OpencodeClientError, body)

proc getPtyPtyID*(client: OpencodeClient, ptyID: string,
                  directory: string = default(string),
                  workspace: string = default(string)): Future[types.Pty] {.async.} =
  ## Retrieve detailed information about a specific pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Pty)
  else:
    raise newException(OpencodeClientError, body)

proc putPtyPtyID*(client: OpencodeClient, ptyID: string,
                  directory: string = default(string),
                  workspace: string = default(string), body: PutPtyPtyIDRequest): Future[types.Pty] {.async.} =
  ## Update properties of an existing pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPUT(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Pty)
  else:
    raise newException(OpencodeClientError, body)

proc deletePtyPtyID*(client: OpencodeClient, ptyID: string,
                     directory: string = default(string),
                     workspace: string = default(string)): Future[bool] {.async.} =
  ## Remove and terminate a specific pseudo-terminal (PTY) session.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpDELETE(fmt"/pty/{ptyID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc postPtyPtyIDConnectToken*(client: OpencodeClient, ptyID: string,
                               directory: string = default(string),
                               workspace: string = default(string)): Future[types.PtyTicketConnectToken] {.async.} =
  ## Create a short-lived ticket for opening a PTY WebSocket connection.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/pty/{ptyID}/connect-token", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PtyTicketConnectToken)
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
                 body: PostApiPtyRequest): Future[PostApiPtyResponse] {.async.} =
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
                     body: PutApiPtyPtyIDRequest): Future[PutApiPtyPtyIDResponse] {.async.} =
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
                            locationDirectory: string = default(string),
                            locationWorkspace: string = default(string),
                            cursor: string = default(string),
                            ticket: string = default(string)): Future[bool] {.async.} =
  ## Establish a WebSocket connection streaming PTY output and accepting terminal
  ## input.

  var q = initOrderedTable[string, string]()
  q["location[directory]"] = $locationDirectory
  q["location[workspace]"] = $locationWorkspace
  q["cursor"] = $cursor
  q["ticket"] = $ticket
  let res = await client.httpGET(fmt"/api/pty/{ptyID}/connect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)

proc getPtyPtyIDConnect*(client: OpencodeClient, ptyID: string,
                         directory: string = default(string),
                         workspace: string = default(string),
                         cursor: string = default(string),
                         ticket: string = default(string)): Future[bool] {.async.} =
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
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
