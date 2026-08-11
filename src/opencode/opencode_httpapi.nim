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
  GetApiHealthResponse* = object
    healthy: bool
  GetApiAgentResponse* = object
    location: types.LocationInfo
    data: seq[types.AgentV2Info]
  PatchApiCredentialCredentialIDRequest = object
    label: string

proc getApiHealth*(client: OpencodeClient): Future[GetApiHealthResponse] {.async.} =
  ## Check whether the API server is ready to accept requests.

  let res = await client.httpGET("/api/health")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiHealthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiLocation*(client: OpencodeClient,
                     location: JsonNode = default(JsonNode)): Future[types.LocationInfo] {.async.} =
  ## Resolve the requested location or the server default location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/location", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LocationInfo)
  else:
    raise newException(OpencodeClientError, body)

proc getApiAgent*(client: OpencodeClient, location: JsonNode = default(JsonNode)): Future[GetApiAgentResponse] {.async.} =
  ## Retrieve currently registered agents.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/agent", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiAgentResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteApiCredentialCredentialID*(client: OpencodeClient,
                                      credentialID: string,
                                      location: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  ## Remove a stored integration credential.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpDELETE(fmt"/api/credential/{credentialID}", q)
  return res

proc patchApiCredentialCredentialID*(client: OpencodeClient,
                                     credentialID: string,
                                     location: JsonNode = default(JsonNode),
                                     body: PatchApiCredentialCredentialIDRequest): Future[AsyncResponse] {.async.} =
  ## Update a stored credential label.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPATCH(fmt"/api/credential/{credentialID}", q)
  return res
