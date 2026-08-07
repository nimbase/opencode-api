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
  GetApiHealthResponse* = object
    healthy: bool
  GetApiAgentResponse* = object
    location: LocationInfo
    data: seq[AgentV2Info]
  ApiCredentialCredentialIDRequest = object
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
                     location: JsonNode = default(JsonNode)): Future[LocationInfo] {.async.} =
  ## Resolve the requested location or the server default location.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/location", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, LocationInfo)
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
                                     body: ApiCredentialCredentialIDRequest): Future[AsyncResponse] {.async.} =
  ## Update a stored credential label.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPATCH(fmt"/api/credential/{credentialID}", q)
  return res
