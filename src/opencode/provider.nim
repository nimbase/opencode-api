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
  GetProviderResponse* = object
    ## List of providers
    all: seq[Provider]
    default: JsonNode
    connected: seq[string]
  ProviderProviderIDOauthAuthorizeRequest = object
    `method`: float64
    inputs: Option[JsonNode]
  ProviderProviderIDOauthCallbackRequest = object
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
                      workspace: string = default(string)): Future[GetProviderAuthResponse] {.async.} =
  ## Retrieve available authentication methods for all AI providers.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpGET("/provider/auth", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetProviderAuthResponse)
  else:
    raise newException(OpencodeClientError, body)

proc postProviderProviderIDOauthAuthorize*(client: OpencodeClient,
                                           providerID: string,
                                           directory: string = default(string),
                                           workspace: string = default(string),
                                           body: ProviderProviderIDOauthAuthorizeRequest): Future[ProviderAuthAuthorization] {.async.} =
  ## Start the OAuth authorization flow for a provider.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/provider/{providerID}/oauth/authorize", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, ProviderAuthAuthorization)
  else:
    raise newException(OpencodeClientError, body)

proc postProviderProviderIDOauthCallback*(client: OpencodeClient,
                                          providerID: string,
                                          directory: string = default(string),
                                          workspace: string = default(string),
                                          body: ProviderProviderIDOauthCallbackRequest): Future[PostProviderProviderIDOauthCallbackResponse] {.async.} =
  ## Handle the OAuth callback from a provider after user authorization.

  var q = initOrderedTable[string, string]()
  q["directory"] = $directory
  q["workspace"] = $workspace
  let res = await client.httpPOST(fmt"/provider/{providerID}/oauth/callback", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostProviderProviderIDOauthCallbackResponse)
  else:
    raise newException(OpencodeClientError, body)
