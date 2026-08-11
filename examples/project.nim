# opencode client — project & VCS example
#
# Requires a running server:
#   opencode serve
#
# Run:
#   nim r project.nim
#
# Config via environment:
#   OPENCODE_BASE_URL  server base URL (default: http://127.0.0.1:4096)
#   OPENCODE_API_KEY   bearer token sent with every request (default: local)

import opencode
import std/[asyncdispatch, os, strutils, options]

const DefaultBaseUrl = "http://127.0.0.1:4096"

proc baseUrl(): string =
  let url = getEnv("OPENCODE_BASE_URL", DefaultBaseUrl)
  result = if url.endsWith("/"): url else: url & "/"

proc apiKey(): string =
  getEnv("OPENCODE_API_KEY", "local")

proc main() {.async.} =
  let client = initOpencodeClient(apiKey())
  client.baseUri = baseUrl()
  try:
    let projects = await client.getProject()
    echo "GET /project (", projects.len, ")"
    for p in projects:
      echo "  ", p.id, "  ", p.name.get(""), "  worktree=", p.worktree

    let current = await client.getProjectCurrent()
    echo "GET /project/current"
    echo "  id:       ", current.id
    echo "  name:     ", current.name.get("")
    echo "  worktree: ", current.worktree

    let vcs = await client.getVcs()
    echo "GET /vcs"
    echo "  branch:         ", vcs.branch.get("")
    echo "  defaultBranch:  ", vcs.default_branch.get("")

    let status = await client.getVcsStatus()
    echo "GET /vcs/status (", status.len, " changed files)"
    for f in status:
      echo "  ", f.status, "  ", f.file, "  (+", f.additions.int, "/-", f.deletions.int, ")"

    # NOTE: the server requires a `mode` query param for /vcs/diff; the empty
    # default (set[InstanceModeOption] = {}) is rejected.
    let diff = await client.getVcsDiff(mode = {modeGit})
    echo "GET /vcs/diff (", diff.len, " files)"
    for d in diff:
      echo "  ", d.status.get(""), "  ", d.file
  except CatchableError as e:
    echo "request failed: ", e.msg.split("\nAsync traceback:")[0]
    echo "is the opencode server running at ", baseUrl(), "?"

when isMainModule:
  waitFor main()
