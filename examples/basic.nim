# opencode — runnable example
#
# Auto-generated from OpenAPI 3.x via Nimbase. Run with:
#   nim r examples/basic.nim

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
