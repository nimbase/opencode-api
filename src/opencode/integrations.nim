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
  GetApiIntegrationResponse* = object
    location: types.LocationInfo
    data: seq[types.IntegrationInfo]
  GetApiIntegrationIntegrationIDResponse* = object
    location: types.LocationInfo
    data: types.IntegrationInfo
  PostApiIntegrationIntegrationIDConnectKeyRequest = object
    key: string
    label: Option[string]
  PostApiIntegrationIntegrationIDConnectOauthRequest = object
    method_i_d: string
    inputs: JsonNode
    label: Option[string]
  PostApiIntegrationIntegrationIDConnectOauthResponse* = object
    location: types.LocationInfo
    data: types.IntegrationAttempt
  GetApiIntegrationAttemptAttemptIDResponse* = object
    location: types.LocationInfo
    data: types.IntegrationAttemptStatus
  PostApiIntegrationAttemptAttemptIDCompleteRequest = object
    code: Option[string]

proc getApiIntegration*(client: OpencodeClient,
                        location: JsonNode = default(JsonNode)): Future[GetApiIntegrationResponse] {.async.} =
  ## Retrieve available integrations and their authentication methods.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/integration", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiIntegrationResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiIntegrationIntegrationID*(client: OpencodeClient,
                                     integrationID: string,
                                     location: JsonNode = default(JsonNode)): Future[GetApiIntegrationIntegrationIDResponse] {.async.} =
  ## Retrieve one integration and its authentication methods.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET(fmt"/api/integration/{integrationID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiIntegrationIntegrationIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postApiIntegrationIntegrationIDConnectKey*(client: OpencodeClient,
                                                integrationID: string,
                                                location: JsonNode = default(JsonNode),
                                                body: PostApiIntegrationIntegrationIDConnectKeyRequest): Future[AsyncResponse] {.async.} =
  ## Run a key authentication method and store the resulting credential.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/api/integration/{integrationID}/connect/key", q)
  return res

proc postApiIntegrationIntegrationIDConnectOauth*(client: OpencodeClient,
                                                  integrationID: string,
                                                  location: JsonNode = default(JsonNode),
                                                  body: PostApiIntegrationIntegrationIDConnectOauthRequest): Future[PostApiIntegrationIntegrationIDConnectOauthResponse] {.async.} =
  ## Start an OAuth attempt and return the authorization details.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/api/integration/{integrationID}/connect/oauth", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostApiIntegrationIntegrationIDConnectOauthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiIntegrationAttemptAttemptID*(client: OpencodeClient,
                                        attemptID: string,
                                        location: JsonNode = default(JsonNode)): Future[GetApiIntegrationAttemptAttemptIDResponse] {.async.} =
  ## Poll the current status of an OAuth attempt.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET(fmt"/api/integration/attempt/{attemptID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiIntegrationAttemptAttemptIDResponse)
  else:
    raise newException(OpencodeClientError, body)

proc deleteApiIntegrationAttemptAttemptID*(client: OpencodeClient,
                                           attemptID: string,
                                           location: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  ## Cancel an OAuth attempt and release its resources.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpDELETE(fmt"/api/integration/attempt/{attemptID}", q)
  return res

proc postApiIntegrationAttemptAttemptIDComplete*(client: OpencodeClient,
                                                 attemptID: string,
                                                 location: JsonNode = default(JsonNode),
                                                 body: PostApiIntegrationAttemptAttemptIDCompleteRequest): Future[AsyncResponse] {.async.} =
  ## Complete a code-based OAuth attempt and store the resulting credential.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpPOST(fmt"/api/integration/attempt/{attemptID}/complete", q)
  return res
