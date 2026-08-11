<p align="center">
  opencode — a typed Nim client auto-generated from OpenAPI 3.x<br>
</p>

<p align="center">
  <code>nimble install opencode</code>
</p>

<p align="center">
  <a href="https://nimbase.github.io/opencode/">API reference</a><br>
  <img src="https://github.com/nimbase/opencode/workflows/test/badge.svg" alt="Github Actions">  <img src="https://github.com/nimbase/opencode/workflows/docs/badge.svg" alt="Github Actions">
</p>

> [!NOTE]
> This package is **auto-generated from an OpenAPI 3.x specification** using
> the [Nimbase](https://github.com/nimbase/nimbase) codegen. Do not edit the
> generated sources by hand — regenerate with `nimbase` instead.

## Features
- Typed client for opencode (188 endpoints)
- Bearer-token authentication
- Mock-server backed test suite
- Async-first, generated with Nimbase


## Examples
```nim
import opencode
import std/asyncdispatch

proc main() {.async.} =
  let client = initOpencodeClient("your-api-key")
  try:
    let res = await client.deleteAuthProviderID("test")
    echo res
  except CatchableError as e:
    echo "request failed: ", e.msg

when isMainModule:
  waitFor main()
```


### ❤ Contributions & Support
- 🐛 Found a bug? [Create a new Issue](https://github.com/nimbase/opencode/issues)
- 👋 Wanna help? [Fork it!](https://github.com/nimbase/opencode/fork)

### 🎩 License
MIT license. [Made with Nimbase Codegen](https://github.com/nimbase)<br>
Copyright Nim Community &mdash; All rights reserved.
