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
  GetApiProviderResponse* = object
    location: LocationInfo
    data: seq[ProviderV2Info]
  GetApiProviderProviderIDResponse* = object
    location: LocationInfo
    data: ProviderV2Info

proc getApiProvider*(client: OpencodeClient,
                     location: JsonNode = default(JsonNode)): Future[GetApiProviderResponse] {.async.} =
  ## Retrieve active AI providers so clients can show provider availability and
  ## configuration.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET("/api/provider", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiProviderResponse)
  else:
    raise newException(OpencodeClientError, body)

proc getApiProviderProviderID*(client: OpencodeClient, providerID: string,
                               location: JsonNode = default(JsonNode)): Future[GetApiProviderProviderIDResponse] {.async.} =
  ## Retrieve a single AI provider so clients can inspect its availability and
  ## endpoint settings.

  var q = initOrderedTable[string, string]()
  q["location"] = $location
  let res = await client.httpGET(fmt"/api/provider/{providerID}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetApiProviderProviderIDResponse)
  else:
    raise newException(OpencodeClientError, body)
