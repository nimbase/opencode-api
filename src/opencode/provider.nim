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
  GetProviderResponse* = object
    ## List of providers
    all: seq[types.Provider]
    default: JsonNode
    connected: seq[string]
  PostProviderProviderIDOauthAuthorizeRequest = object
    `method`: float64
    inputs: Option[JsonNode]
  PostProviderProviderIDOauthCallbackRequest = object
    `method`: float64
    code: Option[string]

proc getProvider*(client: OpencodeClient, directory: string = default(string),
                  workspace: string = default(string)): Future[GetProviderResponse] {.async.} =
  ## Get a list of all available AI providers, including both available and connected
  ## ones.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/provider", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetProviderResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getProviderAuth*(client: OpencodeClient,
                      directory: string = default(string),
                      workspace: string = default(string)): Future[JsonNode] {.async.} =
  ## Retrieve available authentication methods for all AI providers.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/provider/auth", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(OpencodeClientError, body)

proc postProviderProviderIDOauthAuthorize*(client: OpencodeClient,
                                           providerID: string,
                                           directory: string = default(string),
                                           workspace: string = default(string),
                                           body: PostProviderProviderIDOauthAuthorizeRequest): Future[types.ProviderAuthAuthorization] {.async.} =
  ## Start the OAuth authorization flow for a provider.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/provider/{providerID}/oauth/authorize", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ProviderAuthAuthorization)
  else:
    raise newException(OpencodeClientError, body)

proc postProviderProviderIDOauthCallback*(client: OpencodeClient,
                                          providerID: string,
                                          directory: string = default(string),
                                          workspace: string = default(string),
                                          body: PostProviderProviderIDOauthCallbackRequest): Future[bool] {.async.} =
  ## Handle the OAuth callback from a provider after user authorization.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/provider/{providerID}/oauth/callback", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, bool)
  else:
    raise newException(OpencodeClientError, body)
