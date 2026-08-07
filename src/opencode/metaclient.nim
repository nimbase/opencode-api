# opencode API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# using the awesome [Clue CLI Assistant](https://github.com/openpeeps/clue)
#
# Generated at: 2026-08-07T13:04:19+03:00
# License: MIT

import std/[asyncdispatch, httpclient, tables,
        strutils, sequtils, times, uri]

import pkg/openparser/json

export asyncdispatch, httpclient, json, tables, sequtils, times

type
  OpencodeClient* = ref object of RootObj
    baseUri*: string
    httpClient*: AsyncHttpClient
    apiKey*: string

  QueryTable* = OrderedTable[string, string]

  OpencodeClientError* = object of CatchableError

proc `$`*(query: QueryTable): string =
  if query.len > 0:
    add result, "?"
    add result, join(query.keys.toSeq.mapIt(it & "=" & query[it]), "&")

proc initOpencodeClient*(apiKey: string): OpencodeClient =
  new(result)
  result.baseUri = ""
  result.httpClient = newAsyncHttpClient()
  result.httpClient.headers = newHttpHeaders({
    "Accept": "application/json",
    "Authorization": "Bearer " & apiKey
  })
  result.apiKey = apiKey

proc httpGet*(client: OpencodeClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.get(url)

proc httpGet*(client: OpencodeClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.get(url)

proc httpPost*[T](client: OpencodeClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.post(url, toJson(body))

proc httpPost*(client: OpencodeClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.post(url)

proc httpPost*(client: OpencodeClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.post(url)

proc httpPut*[T](client: OpencodeClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPut,
    body = toJson(body))

proc httpPut*(client: OpencodeClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPut)

proc httpPut*(client: OpencodeClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.request(url, httpMethod = HttpPut)

proc httpDelete*(client: OpencodeClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpDelete)

proc httpDelete*(client: OpencodeClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.request(url, httpMethod = HttpDelete)

proc httpPatch*[T](client: OpencodeClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPatch,
    body = toJson(body))

proc httpPatch*(client: OpencodeClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPatch)
