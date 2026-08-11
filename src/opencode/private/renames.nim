import ./types

proc renameHook*(v: QuestionReplied, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "requestID":
    fieldName = "request_i_d"
  elif fieldName == "request_i_d":
    fieldName = "requestID"

proc renameHook*(v: QuestionRejected, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "requestID":
    fieldName = "request_i_d"
  elif fieldName == "request_i_d":
    fieldName = "requestID"

proc renameHook*(v: OAuth, fieldName: var string) {.inline.} =
  if fieldName == "accountId":
    fieldName = "account_id"
  elif fieldName == "account_id":
    fieldName = "accountId"
  elif fieldName == "enterpriseUrl":
    fieldName = "enterprise_url"
  elif fieldName == "enterprise_url":
    fieldName = "enterpriseUrl"

proc renameHook*(v: EffectHttpApiErrorBadRequest, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: InvalidRequestError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: Session, fieldName: var string) {.inline.} =
  if fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"
  elif fieldName == "workspaceID":
    fieldName = "workspace_i_d"
  elif fieldName == "workspace_i_d":
    fieldName = "workspaceID"
  elif fieldName == "parentID":
    fieldName = "parent_i_d"
  elif fieldName == "parent_i_d":
    fieldName = "parentID"

proc renameHook*(v: OutputFormatJsonSchema, fieldName: var string) {.inline.} =
  if fieldName == "retryCount":
    fieldName = "retry_count"
  elif fieldName == "retry_count":
    fieldName = "retryCount"

proc renameHook*(v: UserMessage, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: AssistantMessage, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "parentID":
    fieldName = "parent_i_d"
  elif fieldName == "parent_i_d":
    fieldName = "parentID"
  elif fieldName == "modelID":
    fieldName = "model_i_d"
  elif fieldName == "model_i_d":
    fieldName = "modelID"
  elif fieldName == "providerID":
    fieldName = "provider_i_d"
  elif fieldName == "provider_i_d":
    fieldName = "providerID"

proc renameHook*(v: TextPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: SubtaskPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: ReasoningPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: ResourceSource, fieldName: var string) {.inline.} =
  if fieldName == "clientName":
    fieldName = "client_name"
  elif fieldName == "client_name":
    fieldName = "clientName"

proc renameHook*(v: FilePart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: ToolPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"
  elif fieldName == "callID":
    fieldName = "call_i_d"
  elif fieldName == "call_i_d":
    fieldName = "callID"

proc renameHook*(v: StepStartPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: StepFinishPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: SnapshotPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: PatchPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: AgentPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: RetryPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: CompactionPart, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: Pty, fieldName: var string) {.inline.} =
  if fieldName == "exitCode":
    fieldName = "exit_code"
  elif fieldName == "exit_code":
    fieldName = "exitCode"

proc renameHook*(v: QuestionTool, fieldName: var string) {.inline.} =
  if fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"
  elif fieldName == "callID":
    fieldName = "call_i_d"
  elif fieldName == "call_i_d":
    fieldName = "callID"

proc renameHook*(v: ServerConfig, fieldName: var string) {.inline.} =
  if fieldName == "mdnsDomain":
    fieldName = "mdns_domain"
  elif fieldName == "mdns_domain":
    fieldName = "mdnsDomain"

proc renameHook*(v: AgentConfig, fieldName: var string) {.inline.} =
  if fieldName == "maxSteps":
    fieldName = "max_steps"
  elif fieldName == "max_steps":
    fieldName = "maxSteps"

proc renameHook*(v: McpOAuthConfig, fieldName: var string) {.inline.} =
  if fieldName == "clientId":
    fieldName = "client_id"
  elif fieldName == "client_id":
    fieldName = "clientId"
  elif fieldName == "clientSecret":
    fieldName = "client_secret"
  elif fieldName == "client_secret":
    fieldName = "clientSecret"
  elif fieldName == "callbackPort":
    fieldName = "callback_port"
  elif fieldName == "callback_port":
    fieldName = "callbackPort"
  elif fieldName == "redirectUri":
    fieldName = "redirect_uri"
  elif fieldName == "redirect_uri":
    fieldName = "redirectUri"

proc renameHook*(v: Config, fieldName: var string) {.inline.} =
  if fieldName == "$schema":
    fieldName = "schema"
  elif fieldName == "schema":
    fieldName = "$schema"
  elif fieldName == "logLevel":
    fieldName = "log_level"
  elif fieldName == "log_level":
    fieldName = "logLevel"

proc renameHook*(v: Model, fieldName: var string) {.inline.} =
  if fieldName == "providerID":
    fieldName = "provider_i_d"
  elif fieldName == "provider_i_d":
    fieldName = "providerID"

proc renameHook*(v: ExperimentalCapabilities, fieldName: var string) {.inline.} =
  if fieldName == "backgroundSubagents":
    fieldName = "background_subagents"
  elif fieldName == "background_subagents":
    fieldName = "backgroundSubagents"

proc renameHook*(v: ConsoleState, fieldName: var string) {.inline.} =
  if fieldName == "consoleManagedProviders":
    fieldName = "console_managed_providers"
  elif fieldName == "console_managed_providers":
    fieldName = "consoleManagedProviders"
  elif fieldName == "activeOrgName":
    fieldName = "active_org_name"
  elif fieldName == "active_org_name":
    fieldName = "activeOrgName"
  elif fieldName == "switchableOrgCount":
    fieldName = "switchable_org_count"
  elif fieldName == "switchable_org_count":
    fieldName = "switchableOrgCount"

proc renameHook*(v: EffectHttpApiErrorInternalServerError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: WorktreeCreateInput, fieldName: var string) {.inline.} =
  if fieldName == "startCommand":
    fieldName = "start_command"
  elif fieldName == "start_command":
    fieldName = "startCommand"

proc renameHook*(v: GlobalSession, fieldName: var string) {.inline.} =
  if fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"
  elif fieldName == "workspaceID":
    fieldName = "workspace_i_d"
  elif fieldName == "workspace_i_d":
    fieldName = "workspaceID"
  elif fieldName == "parentID":
    fieldName = "parent_i_d"
  elif fieldName == "parent_i_d":
    fieldName = "parentID"

proc renameHook*(v: McpResource, fieldName: var string) {.inline.} =
  if fieldName == "mimeType":
    fieldName = "mime_type"
  elif fieldName == "mime_type":
    fieldName = "mimeType"

proc renameHook*(v: FileContent, fieldName: var string) {.inline.} =
  if fieldName == "mimeType":
    fieldName = "mime_type"
  elif fieldName == "mime_type":
    fieldName = "mimeType"

proc renameHook*(v: Agent, fieldName: var string) {.inline.} =
  if fieldName == "topP":
    fieldName = "top_p"
  elif fieldName == "top_p":
    fieldName = "topP"

proc renameHook*(v: McpServerNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: ProjectNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"

proc renameHook*(v: PtyNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "ptyID":
    fieldName = "pty_i_d"
  elif fieldName == "pty_i_d":
    fieldName = "ptyID"

proc renameHook*(v: PtyForbiddenError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: QuestionRequest, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: QuestionNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "requestID":
    fieldName = "request_i_d"
  elif fieldName == "request_i_d":
    fieldName = "requestID"

proc renameHook*(v: PermissionRequest, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: PermissionNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "requestID":
    fieldName = "request_i_d"
  elif fieldName == "request_i_d":
    fieldName = "requestID"

proc renameHook*(v: SessionBusyError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: Workspace, fieldName: var string) {.inline.} =
  if fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"
  elif fieldName == "timeUsed":
    fieldName = "time_used"
  elif fieldName == "time_used":
    fieldName = "timeUsed"

proc renameHook*(v: UnauthorizedError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: InvalidCursorError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: SessionNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: ConflictError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: ServiceUnavailableError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: MessageNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"

proc renameHook*(v: UnknownError1, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: SessionHistory, fieldName: var string) {.inline.} =
  if fieldName == "hasMore":
    fieldName = "has_more"
  elif fieldName == "has_more":
    fieldName = "hasMore"

proc renameHook*(v: ProviderNotFoundError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"
  elif fieldName == "providerID":
    fieldName = "provider_i_d"
  elif fieldName == "provider_i_d":
    fieldName = "providerID"

proc renameHook*(v: ForbiddenError, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: EffectHttpApiErrorForbidden, fieldName: var string) {.inline.} =
  if fieldName == "_tag":
    fieldName = "tag"
  elif fieldName == "tag":
    fieldName = "_tag"

proc renameHook*(v: ModelRef, fieldName: var string) {.inline.} =
  if fieldName == "providerID":
    fieldName = "provider_i_d"
  elif fieldName == "provider_i_d":
    fieldName = "providerID"

proc renameHook*(v: LocationRef, fieldName: var string) {.inline.} =
  if fieldName == "workspaceID":
    fieldName = "workspace_i_d"
  elif fieldName == "workspace_i_d":
    fieldName = "workspaceID"

proc renameHook*(v: SessionNextRetryError, fieldName: var string) {.inline.} =
  if fieldName == "statusCode":
    fieldName = "status_code"
  elif fieldName == "status_code":
    fieldName = "statusCode"
  elif fieldName == "isRetryable":
    fieldName = "is_retryable"
  elif fieldName == "is_retryable":
    fieldName = "isRetryable"
  elif fieldName == "responseHeaders":
    fieldName = "response_headers"
  elif fieldName == "response_headers":
    fieldName = "responseHeaders"
  elif fieldName == "responseBody":
    fieldName = "response_body"
  elif fieldName == "response_body":
    fieldName = "responseBody"

proc renameHook*(v: RevertState, fieldName: var string) {.inline.} =
  if fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"
  elif fieldName == "partID":
    fieldName = "part_i_d"
  elif fieldName == "part_i_d":
    fieldName = "partID"

proc renameHook*(v: PermissionV2Source, fieldName: var string) {.inline.} =
  if fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"
  elif fieldName == "callID":
    fieldName = "call_i_d"
  elif fieldName == "call_i_d":
    fieldName = "callID"

proc renameHook*(v: QuestionV2Tool, fieldName: var string) {.inline.} =
  if fieldName == "messageID":
    fieldName = "message_i_d"
  elif fieldName == "message_i_d":
    fieldName = "messageID"
  elif fieldName == "callID":
    fieldName = "call_i_d"
  elif fieldName == "call_i_d":
    fieldName = "callID"

proc renameHook*(v: SyncEventSessionCreated, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionUpdated, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionDeleted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventMessageUpdated, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventMessageRemoved, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventMessagePartUpdated, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventMessagePartRemoved, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextAgentSwitched, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextModelSwitched, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextMoved, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextPrompted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextPromptAdmitted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextContextUpdated, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextSynthetic, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextShellStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextShellEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextStepStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextStepEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextStepFailed, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextTextStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextTextEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextReasoningStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextReasoningEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolInputStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolInputEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolCalled, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolProgress, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolSuccess, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextToolFailed, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextRetried, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextCompactionStarted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextCompactionEnded, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextRevertStaged, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextRevertCleared, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: SyncEventSessionNextRevertCommitted, fieldName: var string) {.inline.} =
  if fieldName == "syncEvent":
    fieldName = "sync_event"
  elif fieldName == "sync_event":
    fieldName = "syncEvent"

proc renameHook*(v: WorkspaceEventConnectionStatus, fieldName: var string) {.inline.} =
  if fieldName == "workspaceID":
    fieldName = "workspace_i_d"
  elif fieldName == "workspace_i_d":
    fieldName = "workspaceID"

proc renameHook*(v: LocationInfo, fieldName: var string) {.inline.} =
  if fieldName == "workspaceID":
    fieldName = "workspace_i_d"
  elif fieldName == "workspace_i_d":
    fieldName = "workspaceID"

proc renameHook*(v: SessionV2Info, fieldName: var string) {.inline.} =
  if fieldName == "parentID":
    fieldName = "parent_i_d"
  elif fieldName == "parent_i_d":
    fieldName = "parentID"
  elif fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"

proc renameHook*(v: SessionInputAdmitted, fieldName: var string) {.inline.} =
  if fieldName == "admittedSeq":
    fieldName = "admitted_seq"
  elif fieldName == "admitted_seq":
    fieldName = "admittedSeq"
  elif fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"
  elif fieldName == "timeCreated":
    fieldName = "time_created"
  elif fieldName == "time_created":
    fieldName = "timeCreated"
  elif fieldName == "promotedSeq":
    fieldName = "promoted_seq"
  elif fieldName == "promoted_seq":
    fieldName = "promotedSeq"

proc renameHook*(v: SessionMessageSynthetic, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: SessionMessageShell, fieldName: var string) {.inline.} =
  if fieldName == "callID":
    fieldName = "call_i_d"
  elif fieldName == "call_i_d":
    fieldName = "callID"

proc renameHook*(v: SessionMessageAssistantReasoning, fieldName: var string) {.inline.} =
  if fieldName == "providerMetadata":
    fieldName = "provider_metadata"
  elif fieldName == "provider_metadata":
    fieldName = "providerMetadata"

proc renameHook*(v: SessionMessageToolStateCompleted, fieldName: var string) {.inline.} =
  if fieldName == "outputPaths":
    fieldName = "output_paths"
  elif fieldName == "output_paths":
    fieldName = "outputPaths"

proc renameHook*(v: ModelV2Info, fieldName: var string) {.inline.} =
  if fieldName == "providerID":
    fieldName = "provider_i_d"
  elif fieldName == "provider_i_d":
    fieldName = "providerID"

proc renameHook*(v: ProviderV2Info, fieldName: var string) {.inline.} =
  if fieldName == "integrationID":
    fieldName = "integration_i_d"
  elif fieldName == "integration_i_d":
    fieldName = "integrationID"

proc renameHook*(v: IntegrationAttempt, fieldName: var string) {.inline.} =
  if fieldName == "attemptID":
    fieldName = "attempt_i_d"
  elif fieldName == "attempt_i_d":
    fieldName = "attemptID"

proc renameHook*(v: PermissionV2Request, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: PermissionSavedInfo, fieldName: var string) {.inline.} =
  if fieldName == "projectID":
    fieldName = "project_i_d"
  elif fieldName == "project_i_d":
    fieldName = "projectID"

proc renameHook*(v: QuestionV2Request, fieldName: var string) {.inline.} =
  if fieldName == "sessionID":
    fieldName = "session_i_d"
  elif fieldName == "session_i_d":
    fieldName = "sessionID"

proc renameHook*(v: CredentialOAuth, fieldName: var string) {.inline.} =
  if fieldName == "methodID":
    fieldName = "method_i_d"
  elif fieldName == "method_i_d":
    fieldName = "methodID"

