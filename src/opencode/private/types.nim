import std/[options, json]

type
  Event* = ref object of RootObj

  QuestionReplied* = ref object of RootObj
    session_i_d*: string
    request_i_d*: string
    answers*: seq[QuestionAnswer]

  QuestionRejected* = ref object of RootObj
    session_i_d*: string
    request_i_d*: string

  OAuth* = ref object of RootObj
    `type`*: string
    refresh*: string
    access*: string
    expires*: int64
    account_id*: Option[string]
    enterprise_url*: Option[string]

  ApiAuth* = ref object of RootObj
    `type`*: string
    key*: string
    metadata*: Option[JsonNode]

  WellKnownAuth* = ref object of RootObj
    `type`*: string
    key*: string
    token*: string

  Auth* = ref object of RootObj

  EffectHttpApiErrorBadRequest* = ref object of RootObj
    tag*: string

  InvalidRequestError* = ref object of RootObj
    tag*: string
    message*: string
    kind*: Option[string]
    field*: Option[string]

  MoveSessionError* = ref object of RootObj
    name*: string
    data*: JsonNode

  SnapshotFileDiff* = ref object of RootObj
    file*: Option[string]
    patch*: Option[string]
    additions*: float64
    deletions*: float64
    status*: Option[string]

  PermissionAction* = enum
    allow = "allow"
    deny = "deny"
    ask = "ask"

  PermissionRule* = ref object of RootObj
    permission*: string
    pattern*: string
    action*: PermissionAction

  PermissionRuleset* = seq[PermissionRule]

  Session* = ref object of RootObj
    id*: string
    slug*: string
    project_i_d*: string
    workspace_i_d*: Option[string]
    directory*: string
    path*: Option[string]
    parent_i_d*: Option[string]
    summary*: Option[JsonNode]
    cost*: Option[float64]
    tokens*: Option[JsonNode]
    share*: Option[JsonNode]
    title*: string
    agent*: Option[string]
    model*: Option[JsonNode]
    version*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    permission*: Option[PermissionRuleset]
    revert*: Option[JsonNode]

  OutputFormatText* = ref object of RootObj
    `type`*: string

  JSONSchema* = ref object of RootObj

  OutputFormatJsonSchema* = ref object of RootObj
    `type`*: string
    schema*: JSONSchema
    retry_count*: Option[int64]

  OutputFormat* = ref object of RootObj

  UserMessage* = ref object of RootObj
    id*: string
    session_i_d*: string
    role*: string
    time*: JsonNode
    format*: Option[OutputFormat]
    summary*: Option[JsonNode]
    agent*: string
    model*: JsonNode
    system*: Option[string]
    tools*: Option[JsonNode]

  ProviderAuthError* = ref object of RootObj
    name*: string
    data*: JsonNode

  UnknownError* = ref object of RootObj
    name*: string
    data*: JsonNode

  MessageOutputLengthError* = ref object of RootObj
    name*: string
    data*: JsonNode

  MessageAbortedError* = ref object of RootObj
    name*: string
    data*: JsonNode

  StructuredOutputError* = ref object of RootObj
    name*: string
    data*: JsonNode

  ContextOverflowError* = ref object of RootObj
    name*: string
    data*: JsonNode

  ContentFilterError* = ref object of RootObj
    name*: string
    data*: JsonNode

  APIError* = ref object of RootObj
    name*: string
    data*: JsonNode

  AssistantMessage* = ref object of RootObj
    id*: string
    session_i_d*: string
    role*: string
    time*: JsonNode
    error*: Option[JsonNode]
    parent_i_d*: string
    model_i_d*: string
    provider_i_d*: string
    mode*: string
    agent*: string
    path*: JsonNode
    summary*: Option[bool]
    cost*: float64
    tokens*: JsonNode
    structured*: Option[JsonNode]
    variant*: Option[string]
    finish*: Option[string]

  Message* = ref object of RootObj

  TextPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    text*: string
    synthetic*: Option[bool]
    ignored*: Option[bool]
    time*: Option[JsonNode]
    metadata*: Option[JsonNode]

  SubtaskPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    prompt*: string
    description*: string
    agent*: string
    model*: Option[JsonNode]
    command*: Option[string]

  ReasoningPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    text*: string
    metadata*: Option[JsonNode]
    time*: JsonNode

  FilePartSourceText* = ref object of RootObj
    value*: string
    start*: float64
    `end`*: float64

  FileSource* = ref object of RootObj
    text*: FilePartSourceText
    `type`*: string
    path*: string

  Range* = ref object of RootObj
    start*: JsonNode
    `end`*: JsonNode

  SymbolSource* = ref object of RootObj
    text*: FilePartSourceText
    `type`*: string
    path*: string
    range*: Range
    name*: string
    kind*: int64

  ResourceSource* = ref object of RootObj
    text*: FilePartSourceText
    `type`*: string
    client_name*: string
    uri*: string

  FilePartSource* = ref object of RootObj

  FilePart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    mime*: string
    filename*: Option[string]
    url*: string
    source*: Option[FilePartSource]

  ToolStatePending* = ref object of RootObj
    status*: string
    input*: JsonNode
    raw*: string

  ToolStateRunning* = ref object of RootObj
    status*: string
    input*: JsonNode
    title*: Option[string]
    metadata*: Option[JsonNode]
    time*: JsonNode

  ToolStateCompleted* = ref object of RootObj
    status*: string
    input*: JsonNode
    output*: string
    title*: string
    metadata*: JsonNode
    time*: JsonNode
    attachments*: Option[seq[FilePart]]

  ToolStateError* = ref object of RootObj
    status*: string
    input*: JsonNode
    error*: string
    metadata*: Option[JsonNode]
    time*: JsonNode

  ToolState* = ref object of RootObj

  ToolPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    call_i_d*: string
    tool*: string
    state*: ToolState
    metadata*: Option[JsonNode]

  StepStartPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    snapshot*: Option[string]

  StepFinishPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    reason*: string
    snapshot*: Option[string]
    cost*: float64
    tokens*: JsonNode

  SnapshotPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    snapshot*: string

  PatchPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    hash*: string
    files*: seq[string]

  AgentPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    name*: string
    source*: Option[JsonNode]

  RetryPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    attempt*: int64
    error*: APIError
    time*: JsonNode

  CompactionPart* = ref object of RootObj
    id*: string
    session_i_d*: string
    message_i_d*: string
    `type`*: string
    auto*: bool
    overflow*: Option[bool]
    tail_start_id*: Option[string]

  Part* = ref object of RootObj

  Prompt* = ref object of RootObj
    text*: string
    files*: Option[seq[PromptFileAttachment]]
    agents*: Option[seq[PromptAgentAttachment]]

  Pty* = ref object of RootObj
    id*: string
    title*: string
    command*: string
    args*: seq[string]
    cwd*: string
    status*: string
    pid*: int64
    exit_code*: Option[int64]

  Todo* = ref object of RootObj
    content*: string
      ## Brief description of the task
    status*: string
      ## Current status of the task: pending, in_progress, completed, cancelled
    priority*: string
      ## Priority level of the task: high, medium, low

  SessionStatus* = ref object of RootObj

  QuestionOption* = ref object of RootObj
    label*: string
      ## Display text (1-5 words, concise)
    description*: string
      ## Explanation of choice

  QuestionInfo* = ref object of RootObj
    question*: string
      ## Complete question
    header*: string
      ## Very short label (max 30 chars)
    options*: seq[QuestionOption]
      ## Available choices
    multiple*: Option[bool]
    custom*: Option[bool]

  QuestionTool* = ref object of RootObj
    message_i_d*: string
    call_i_d*: string

  QuestionAnswer* = seq[string]

  GlobalEvent* = ref object of RootObj
    directory*: string
    project*: Option[string]
    workspace*: Option[string]
    payload*: JsonNode

  LogLevel* = enum
    ## Log level
    DEBUG = "DEBUG"
    INFO = "INFO"
    WARN = "WARN"
    ERROR = "ERROR"

  ServerConfig* = ref object of RootObj
    ## Server configuration for opencode serve and web commands
    port*: Option[int64]
    hostname*: Option[string]
    mdns*: Option[bool]
    mdns_domain*: Option[string]
    cors*: Option[seq[string]]

  PermissionActionConfig* = enum
    ask = "ask"
    allow = "allow"
    deny = "deny"

  PermissionObjectConfig* = ref object of RootObj

  PermissionRuleConfig* = ref object of RootObj

  PermissionConfig* = ref object of RootObj

  AgentConfig* = ref object of RootObj
    model*: Option[string]
    variant*: Option[string]
    temperature*: Option[float64]
    top_p*: Option[float64]
    prompt*: Option[string]
    tools*: Option[JsonNode]
    disable*: Option[bool]
    description*: Option[string]
    mode*: Option[string]
    hidden*: Option[bool]
    options*: Option[JsonNode]
    color*: Option[JsonNode]
      ## Hex color code (e.g., #FF5733) or theme color (e.g., primary)
    steps*: Option[int64]
    max_steps*: Option[int64]
    permission*: Option[PermissionConfig]

  ProviderConfig* = ref object of RootObj
    api*: Option[string]
    name*: Option[string]
    env*: Option[seq[string]]
    id*: Option[string]
    npm*: Option[string]
    whitelist*: Option[seq[string]]
    blacklist*: Option[seq[string]]
    options*: Option[JsonNode]
    models*: Option[JsonNode]

  McpLocalConfig* = ref object of RootObj
    `type`*: string
      ## Type of MCP server connection
    command*: seq[string]
      ## Command and arguments to run the MCP server
    cwd*: Option[string]
    environment*: Option[JsonNode]
    enabled*: Option[bool]
    timeout*: Option[int64]

  McpOAuthConfig* = ref object of RootObj
    client_id*: Option[string]
    client_secret*: Option[string]
    scope*: Option[string]
    callback_port*: Option[int64]
    redirect_uri*: Option[string]

  McpRemoteConfig* = ref object of RootObj
    `type`*: string
      ## Type of MCP server connection
    url*: string
      ## URL of the remote MCP server
    enabled*: Option[bool]
    headers*: Option[JsonNode]
    oauth*: Option[JsonNode]
      ## OAuth authentication configuration for the MCP server. Set to false to disable
      ## OAuth auto-detection.
    timeout*: Option[int64]

  LayoutConfig* = enum
    ## @deprecated Always uses stretch layout.
    auto = "auto"
    stretch = "stretch"

  ImageAttachmentConfig* = ref object of RootObj
    auto_resize*: Option[bool]
    max_width*: Option[int64]
    max_height*: Option[int64]
    max_base64_bytes*: Option[int64]

  AttachmentConfig* = ref object of RootObj
    image*: Option[ImageAttachmentConfig]

  Config* = ref object of RootObj
    schema*: Option[string]
    shell*: Option[string]
    log_level*: Option[LogLevel]
    server*: Option[ServerConfig]
    command*: Option[JsonNode]
    skills*: Option[JsonNode]
    references*: Option[JsonNode]
    reference*: Option[JsonNode]
    watcher*: Option[JsonNode]
    snapshot*: Option[bool]
    plugin*: Option[seq[JsonNode]]
    share*: Option[string]
    autoshare*: Option[bool]
    autoupdate*: Option[JsonNode]
      ## Automatically update to the latest version. Set to true to auto-update, false to
      ## disable, or 'notify' to show update notifications
    disabled_providers*: Option[seq[string]]
    enabled_providers*: Option[seq[string]]
    model*: Option[string]
    small_model*: Option[string]
    default_agent*: Option[string]
    subagent_depth*: Option[int64]
    username*: Option[string]
    mode*: Option[JsonNode]
    agent*: Option[JsonNode]
    provider*: Option[JsonNode]
    mcp*: Option[JsonNode]
    formatter*: Option[JsonNode]
      ## Enable or configure formatters. Omit or set to false to disable, true to enable
      ## built-ins, or an object to enable built-ins with overrides.
    lsp*: Option[JsonNode]
      ## Enable or configure LSP servers. Omit or set to false to disable, true to enable
      ## built-ins, or an object to enable built-ins with overrides.
    instructions*: Option[seq[string]]
    layout*: Option[LayoutConfig]
    permission*: Option[PermissionConfig]
    tools*: Option[JsonNode]
    attachment*: Option[AttachmentConfig]
    enterprise*: Option[JsonNode]
    tool_output*: Option[JsonNode]
    compaction*: Option[JsonNode]
    experimental*: Option[JsonNode]

  Model* = ref object of RootObj
    id*: string
    provider_i_d*: string
    api*: JsonNode
    name*: string
    family*: Option[string]
    capabilities*: JsonNode
    cost*: JsonNode
    limit*: JsonNode
    status*: string
    options*: JsonNode
    headers*: JsonNode
    release_date*: string
    variants*: Option[JsonNode]

  Provider* = ref object of RootObj
    id*: string
    name*: string
    source*: string
    env*: seq[string]
    key*: Option[string]
    options*: JsonNode
    models*: JsonNode

  ExperimentalCapabilities* = ref object of RootObj
    background_subagents*: bool

  ConsoleState* = ref object of RootObj
    console_managed_providers*: seq[string]
    active_org_name*: Option[string]
    switchable_org_count*: int64

  EffectHttpApiErrorInternalServerError* = ref object of RootObj
    tag*: string

  ToolListItem* = ref object of RootObj
    id*: string
    description*: string
    parameters*: JsonNode

  ToolList* = seq[ToolListItem]

  ToolIDs* = seq[string]

  WorktreeError* = ref object of RootObj
    name*: string
    data*: JsonNode

  WorktreeCreateInput* = ref object of RootObj
    name*: Option[string]
    start_command*: Option[string]
      ## Additional startup script to run after the project's start command

  Worktree* = ref object of RootObj
    name*: string
    branch*: Option[string]
    directory*: string

  WorktreeRemoveInput* = ref object of RootObj
    directory*: string

  WorktreeResetInput* = ref object of RootObj
    directory*: string

  ProjectSummary* = ref object of RootObj
    id*: string
    name*: Option[string]
    worktree*: string

  GlobalSession* = ref object of RootObj
    id*: string
    slug*: string
    project_i_d*: string
    workspace_i_d*: Option[string]
    directory*: string
    path*: Option[string]
    parent_i_d*: Option[string]
    summary*: Option[JsonNode]
    cost*: Option[float64]
    tokens*: Option[JsonNode]
    share*: Option[JsonNode]
    title*: string
    agent*: Option[string]
    model*: Option[JsonNode]
    version*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    permission*: Option[PermissionRuleset]
    revert*: Option[JsonNode]
    project*: JsonNode

  McpResource* = ref object of RootObj
    name*: string
    uri*: string
    description*: Option[string]
    mime_type*: Option[string]
    client*: string

  Symbol* = ref object of RootObj
    name*: string
    kind*: int64
    location*: JsonNode

  FileNode* = ref object of RootObj
    name*: string
    path*: string
    absolute*: string
    `type`*: string
    ignored*: bool

  FileContent* = ref object of RootObj
    `type`*: string
    content*: string
    diff*: Option[string]
    patch*: Option[JsonNode]
    encoding*: Option[string]
    mime_type*: Option[string]

  File* = ref object of RootObj
    path*: string
    added*: int64
    removed*: int64
    status*: string

  Path* = ref object of RootObj
    home*: string
    state*: string
    config*: string
    worktree*: string
    directory*: string

  VcsInfo* = ref object of RootObj
    branch*: Option[string]
    default_branch*: Option[string]

  VcsFileStatus* = ref object of RootObj
    file*: string
    additions*: float64
    deletions*: float64
    status*: string

  VcsFileDiff* = ref object of RootObj
    file*: string
    patch*: Option[string]
    additions*: float64
    deletions*: float64
    status*: Option[string]

  VcsApplyError* = ref object of RootObj
    name*: string
    data*: JsonNode

  Command* = ref object of RootObj
    name*: string
    description*: Option[string]
    agent*: Option[string]
    model*: Option[string]
    source*: Option[string]
    `template`*: string
    subtask*: Option[bool]
    hints*: seq[string]

  Agent* = ref object of RootObj
    name*: string
    description*: Option[string]
    mode*: string
    native*: Option[bool]
    hidden*: Option[bool]
    top_p*: Option[float64]
    temperature*: Option[float64]
    color*: Option[string]
    permission*: PermissionRuleset
    model*: Option[JsonNode]
    variant*: Option[string]
    prompt*: Option[string]
    options*: JsonNode
    steps*: Option[float64]

  LSPStatus* = ref object of RootObj
    id*: string
    name*: string
    root*: string
    status*: string

  FormatterStatus* = ref object of RootObj
    name*: string
    extensions*: seq[string]
    enabled*: bool

  MCPStatusConnected* = ref object of RootObj
    status*: string

  MCPStatusDisabled* = ref object of RootObj
    status*: string

  MCPStatusFailed* = ref object of RootObj
    status*: string
    error*: string

  MCPStatusNeedsAuth* = ref object of RootObj
    status*: string

  MCPStatusNeedsClientRegistration* = ref object of RootObj
    status*: string
    error*: string

  MCPStatus* = ref object of RootObj

  McpUnsupportedOAuthError* = ref object of RootObj
    error*: string

  McpServerNotFoundError* = ref object of RootObj
    tag*: string
    name*: string
    message*: string

  Project* = ref object of RootObj
    id*: string
    worktree*: string
    vcs*: Option[ProjectVcs]
    name*: Option[string]
    icon*: Option[ProjectIcon]
    commands*: Option[ProjectCommands]
    time*: ProjectTime
    sandboxes*: seq[string]

  ProjectNotFoundError* = ref object of RootObj
    tag*: string
    project_i_d*: string
    message*: string

  PtyNotFoundError* = ref object of RootObj
    tag*: string
    pty_i_d*: string
    message*: string

  PtyForbiddenError* = ref object of RootObj
    tag*: string
    message*: string

  QuestionRequest* = ref object of RootObj
    id*: string
    session_i_d*: string
    questions*: seq[QuestionInfo]
      ## Questions to ask
    tool*: Option[QuestionTool]

  QuestionNotFoundError* = ref object of RootObj
    tag*: string
    request_i_d*: string
    message*: string

  PermissionRequest* = ref object of RootObj
    id*: string
    session_i_d*: string
    permission*: string
    patterns*: seq[string]
    metadata*: JsonNode
    always*: seq[string]
    tool*: Option[JsonNode]

  PermissionNotFoundError* = ref object of RootObj
    tag*: string
    request_i_d*: string
    message*: string

  ProviderAuthMethod* = ref object of RootObj
    `type`*: string
    label*: string
    prompts*: Option[seq[JsonNode]]

  ProviderAuthAuthorization* = ref object of RootObj
    url*: string
    `method`*: string
    instructions*: string

  ProviderAuthError1* = ref object of RootObj
    name*: string
    data*: JsonNode

  NotFoundError* = ref object of RootObj
    name*: string
    data*: JsonNode

  TextPartInput* = ref object of RootObj
    id*: Option[string]
    `type`*: string
    text*: string
    synthetic*: Option[bool]
    ignored*: Option[bool]
    time*: Option[JsonNode]
    metadata*: Option[JsonNode]

  FilePartInput* = ref object of RootObj
    id*: Option[string]
    `type`*: string
    mime*: string
    filename*: Option[string]
    url*: string
    source*: Option[FilePartSource]

  AgentPartInput* = ref object of RootObj
    id*: Option[string]
    `type`*: string
    name*: string
    source*: Option[JsonNode]

  SubtaskPartInput* = ref object of RootObj
    id*: Option[string]
    `type`*: string
    prompt*: string
    description*: string
    agent*: string
    model*: Option[JsonNode]
    command*: Option[string]

  SessionBusyError* = ref object of RootObj
    tag*: string
    session_i_d*: string
    message*: string

  EventTuiPromptAppend* = ref object of RootObj
    `type`*: string
    properties*: JsonNode

  EventTuiCommandExecute* = ref object of RootObj
    `type`*: string
    properties*: JsonNode

  EventTuiToastShow* = ref object of RootObj
    `type`*: string
    properties*: JsonNode

  EventTuiSessionSelect* = ref object of RootObj
    `type`*: string
    properties*: JsonNode

  Workspace* = ref object of RootObj
    id*: string
    `type`*: string
    name*: string
    branch*: Option[JsonNode]
    directory*: Option[JsonNode]
    extra*: Option[JsonNode]
    project_i_d*: string
    time_used*: JsonNode

  WorkspaceCreateError* = ref object of RootObj
    name*: string
    data*: JsonNode

  WorkspaceWarpError* = ref object of RootObj
    name*: string
    data*: JsonNode

  UnauthorizedError* = ref object of RootObj
    tag*: string
    message*: string

  SessionsResponse* = ref object of RootObj
    data*: seq[SessionV2Info]
    cursor*: JsonNode

  InvalidCursorError* = ref object of RootObj
    tag*: string
    message*: string

  SessionActive* = ref object of RootObj
    `type`*: string

  SessionNotFoundError* = ref object of RootObj
    tag*: string
    session_i_d*: string
    message*: string

  PromptInput* = ref object of RootObj
    text*: string
    files*: Option[seq[PromptInputFileAttachment]]
    agents*: Option[seq[PromptAgentAttachment]]

  ConflictError* = ref object of RootObj
    tag*: string
    message*: string
    resource*: Option[string]

  ServiceUnavailableError* = ref object of RootObj
    tag*: string
    message*: string
    service*: Option[string]

  MessageNotFoundError* = ref object of RootObj
    tag*: string
    session_i_d*: string
    message_i_d*: string
    message*: string

  UnknownError1* = ref object of RootObj
    tag*: string
    message*: string
    `ref`*: Option[string]

  SessionDurableEvent* = ref object of RootObj

  SessionHistory* = ref object of RootObj
    data*: seq[SessionDurableEvent]
    has_more*: bool

  SessionDurableEventStream* = string

  SessionMessagesResponse* = ref object of RootObj
    data*: seq[SessionMessage]
    cursor*: JsonNode

  ProviderNotFoundError* = ref object of RootObj
    tag*: string
    provider_i_d*: string
    message*: string

  OutputFormat1* = ref object of RootObj

  SessionStatus2* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionReplied2* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionRejected2* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  V2Event* = ref object of RootObj

  V2EventStream* = string

  ForbiddenError* = ref object of RootObj
    tag*: string
    message*: string

  ProjectCopyError* = ref object of RootObj
    name*: string
    data*: JsonNode

  EffectHttpApiErrorForbidden* = ref object of RootObj
    tag*: string

  EventTuiPromptAppend2* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventTuiCommandExecute2* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventTuiToastShow2* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventTuiSessionSelect2* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  CredentialValue* = ref object of RootObj

  IntegrationInputs* = ref object of RootObj

  IntegrationMethod* = ref object of RootObj

  IntegrationRef* = ref object of RootObj
    id*: string
    name*: string

  SkillV2Source* = ref object of RootObj

  MoveSessionDestination* = ref object of RootObj
    directory*: string

  ModelRef* = ref object of RootObj
    id*: string
    provider_i_d*: string
    variant*: Option[string]

  LocationRef* = ref object of RootObj
    directory*: string
    workspace_i_d*: Option[string]

  PromptSource* = ref object of RootObj
    start*: float64
    `end`*: float64
    text*: string

  PromptFileAttachment* = ref object of RootObj
    uri*: string
    mime*: string
    name*: Option[string]
    description*: Option[string]
    source*: Option[PromptSource]

  PromptAgentAttachment* = ref object of RootObj
    name*: string
    source*: Option[PromptSource]

  SessionErrorUnknown* = ref object of RootObj
    `type`*: string
    message*: string

  LLMProviderMetadata* = ref object of RootObj

  ToolTextContent* = ref object of RootObj
    `type`*: string
    text*: string

  ToolFileContent* = ref object of RootObj
    `type`*: string
    uri*: string
    mime*: string
    name*: Option[string]

  LLMToolContent* = ref object of RootObj

  SessionNextRetryError* = ref object of RootObj
    message*: string
    status_code*: Option[float64]
    is_retryable*: bool
    response_headers*: Option[JsonNode]
    response_body*: Option[string]
    metadata*: Option[JsonNode]

  FileDiff* = ref object of RootObj
    path*: string
    status*: string
    additions*: int64
    deletions*: int64
    patch*: string

  RevertState* = ref object of RootObj
    message_i_d*: string
    part_i_d*: Option[string]
    snapshot*: Option[string]
    diff*: Option[string]
    files*: Option[seq[FileDiff]]

  PermissionV2Source* = ref object of RootObj
    `type`*: string
    message_i_d*: string
    call_i_d*: string

  PermissionV2Reply* = enum
    once = "once"
    always = "always"
    reject = "reject"

  QuestionV2Option* = ref object of RootObj
    label*: string
      ## Display text (1-5 words, concise)
    description*: string
      ## Explanation of choice

  QuestionV2Info* = ref object of RootObj
    question*: string
      ## Complete question
    header*: string
      ## Very short label (max 30 chars)
    options*: seq[QuestionV2Option]
      ## Available choices
    multiple*: Option[bool]
    custom*: Option[bool]

  QuestionV2Tool* = ref object of RootObj
    message_i_d*: string
    call_i_d*: string

  QuestionV2Answer* = seq[string]

  ProjectVcs* = enum
    git = "git"

  ProjectIcon* = ref object of RootObj
    url*: Option[string]
    override*: Option[string]
    color*: Option[string]

  ProjectCommands* = ref object of RootObj
    start*: Option[string]
      ## Startup script to run when creating a new workspace (worktree)

  ProjectTime* = ref object of RootObj
    created*: int64
    updated*: int64
    initialized*: Option[int64]

  EventServerInstanceDisposed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  SyncEventSessionCreated* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionUpdated* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionDeleted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventMessageUpdated* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventMessageRemoved* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventMessagePartUpdated* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventMessagePartRemoved* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextAgentSwitched* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextModelSwitched* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextMoved* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextPrompted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextPromptAdmitted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextContextUpdated* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextSynthetic* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextShellStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextShellEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextStepStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextStepEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextStepFailed* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextTextStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextTextEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextReasoningStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextReasoningEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolInputStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolInputEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolCalled* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolProgress* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolSuccess* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextToolFailed* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextRetried* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextCompactionStarted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextCompactionEnded* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextRevertStaged* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextRevertCleared* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  SyncEventSessionNextRevertCommitted* = ref object of RootObj
    `type`*: string
    id*: string
    sync_event*: JsonNode

  ConfigV2ReferenceGit* = ref object of RootObj
    repository*: string
    branch*: Option[string]
    description*: Option[string]
    hidden*: Option[bool]

  ConfigV2ReferenceLocal* = ref object of RootObj
    path*: string
    description*: Option[string]
    hidden*: Option[bool]

  PolicyEffect* = enum
    allow = "allow"
    deny = "deny"

  ConfigV2ExperimentalPolicy* = ref object of RootObj
    action*: string
    effect*: PolicyEffect
    resource*: string

  ProjectDirectories* = seq[JsonNode]

  PtyTicketConnectToken* = ref object of RootObj
    ticket*: string
    expires_in*: int64

  WorkspaceEventConnectionStatus* = ref object of RootObj
    workspace_i_d*: string
    status*: string

  LocationInfo* = ref object of RootObj
    directory*: string
    workspace_i_d*: Option[string]
    project*: JsonNode

  ProviderRequest* = ref object of RootObj
    headers*: JsonNode
    body*: JsonNode

  AgentColor* = ref object of RootObj

  PermissionV2Effect* = enum
    allow = "allow"
    deny = "deny"
    ask = "ask"

  PermissionV2Rule* = ref object of RootObj
    action*: string
    resource*: string
    effect*: PermissionV2Effect

  PermissionV2Ruleset* = seq[PermissionV2Rule]

  AgentV2Info* = ref object of RootObj
    id*: string
    model*: Option[ModelRef]
    request*: ProviderRequest
    system*: Option[string]
    description*: Option[string]
    mode*: string
    hidden*: bool
    color*: Option[AgentColor]
    steps*: Option[int64]
    permissions*: PermissionV2Ruleset

  SessionV2Info* = ref object of RootObj
    id*: string
    parent_i_d*: Option[string]
    project_i_d*: string
    agent*: Option[string]
    model*: Option[ModelRef]
    cost*: float64
    tokens*: JsonNode
    time*: JsonNode
    title*: string
    location*: LocationRef
    subpath*: Option[string]
    revert*: Option[RevertState]

  PromptInputFileAttachment* = ref object of RootObj
    uri*: string
    name*: Option[string]
    description*: Option[string]
    source*: Option[PromptSource]

  SessionInputAdmitted* = ref object of RootObj
    admitted_seq*: int64
    id*: string
    session_i_d*: string
    prompt*: Prompt
    delivery*: string
    time_created*: float64
    promoted_seq*: Option[int64]

  SessionMessageAgentSwitched* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    `type`*: string
    agent*: string

  SessionMessageModelSwitched* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    `type`*: string
    model*: ModelRef

  SessionMessageUser* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    text*: string
    files*: Option[seq[PromptFileAttachment]]
    agents*: Option[seq[PromptAgentAttachment]]
    `type`*: string

  SessionMessageSynthetic* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    session_i_d*: string
    text*: string
    `type`*: string

  SessionMessageSystem* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    `type`*: string
    text*: string

  SessionMessageShell* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    `type`*: string
    call_i_d*: string
    command*: string
    output*: string

  SessionMessageAssistantText* = ref object of RootObj
    `type`*: string
    id*: string
    text*: string

  SessionMessageAssistantReasoning* = ref object of RootObj
    `type`*: string
    id*: string
    text*: string
    provider_metadata*: Option[LLMProviderMetadata]
    time*: Option[JsonNode]

  SessionMessageToolStatePending* = ref object of RootObj
    status*: string
    input*: string

  SessionMessageToolStateRunning* = ref object of RootObj
    status*: string
    input*: JsonNode
    structured*: JsonNode
    content*: seq[LLMToolContent]

  SessionMessageToolStateCompleted* = ref object of RootObj
    status*: string
    input*: JsonNode
    attachments*: Option[seq[PromptFileAttachment]]
    content*: seq[LLMToolContent]
    output_paths*: Option[seq[string]]
    structured*: JsonNode
    result*: Option[JsonNode]

  SessionMessageToolStateError* = ref object of RootObj
    status*: string
    input*: JsonNode
    content*: seq[LLMToolContent]
    structured*: JsonNode
    error*: SessionErrorUnknown
    result*: Option[JsonNode]

  SessionMessageAssistantTool* = ref object of RootObj
    `type`*: string
    id*: string
    name*: string
    provider*: Option[JsonNode]
    state*: JsonNode
    time*: JsonNode

  SessionMessageAssistant* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode
    `type`*: string
    agent*: string
    model*: ModelRef
    content*: seq[JsonNode]
    snapshot*: Option[JsonNode]
    finish*: Option[string]
    cost*: Option[float64]
    tokens*: Option[JsonNode]
    error*: Option[SessionErrorUnknown]

  SessionMessageCompaction* = ref object of RootObj
    `type`*: string
    reason*: string
    summary*: string
    recent*: string
    id*: string
    metadata*: Option[JsonNode]
    time*: JsonNode

  SessionMessage* = ref object of RootObj

  SessionNextAgentSwitched* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextModelSwitched* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextMoved* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextPrompted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextPromptAdmitted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextContextUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextSynthetic* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextShellStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextShellEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextStepStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextStepEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextStepFailed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextTextStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextTextEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolInputStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolInputEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolCalled* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolProgress* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolSuccess* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolFailed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextReasoningStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextReasoningEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextRetried* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextCompactionStarted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextCompactionEnded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextRevertStaged* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextRevertCleared* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextRevertCommitted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  ModelApi* = ref object of RootObj

  ModelCapabilities* = ref object of RootObj
    tools*: bool
    input*: seq[string]
    output*: seq[string]

  ModelCost* = ref object of RootObj
    tier*: Option[JsonNode]
    input*: float64
    output*: float64
    cache*: JsonNode

  ModelV2Info* = ref object of RootObj
    id*: string
    provider_i_d*: string
    family*: Option[string]
    name*: string
    api*: ModelApi
    capabilities*: ModelCapabilities
    request*: JsonNode
    variants*: seq[JsonNode]
    time*: JsonNode
    cost*: seq[ModelCost]
    status*: string
    enabled*: bool
    limit*: JsonNode

  ProviderAISDK* = ref object of RootObj
    `type`*: string
    package*: string
    url*: Option[string]
    settings*: Option[JsonNode]

  ProviderNative* = ref object of RootObj
    `type`*: string
    url*: Option[string]
    settings*: JsonNode

  ProviderApi* = ref object of RootObj

  ProviderV2Info* = ref object of RootObj
    id*: string
    integration_i_d*: Option[string]
    name*: string
    disabled*: Option[bool]
    api*: ProviderApi
    request*: ProviderRequest

  IntegrationWhen* = ref object of RootObj
    key*: string
    op*: string
    value*: string

  IntegrationTextPrompt* = ref object of RootObj
    `type`*: string
    key*: string
    message*: string
    placeholder*: Option[string]
    `when`*: Option[IntegrationWhen]

  IntegrationSelectPrompt* = ref object of RootObj
    `type`*: string
    key*: string
    message*: string
    options*: seq[JsonNode]
    `when`*: Option[IntegrationWhen]

  IntegrationOAuthMethod* = ref object of RootObj
    id*: string
    `type`*: string
    label*: string
    prompts*: Option[seq[JsonNode]]

  IntegrationKeyMethod* = ref object of RootObj
    `type`*: string
    label*: Option[string]

  IntegrationEnvMethod* = ref object of RootObj
    `type`*: string
    names*: seq[string]

  ConnectionCredentialInfo* = ref object of RootObj
    `type`*: string
    id*: string
    label*: string

  ConnectionEnvInfo* = ref object of RootObj
    `type`*: string
    name*: string

  ConnectionInfo* = ref object of RootObj

  IntegrationInfo* = ref object of RootObj
    id*: string
    name*: string
    methods*: seq[IntegrationMethod]
    connections*: seq[ConnectionInfo]

  IntegrationAttempt* = ref object of RootObj
    attempt_i_d*: string
    url*: string
    instructions*: string
    mode*: string
    time*: JsonNode

  IntegrationAttemptStatus* = ref object of RootObj

  PermissionV2Request* = ref object of RootObj
    id*: string
    session_i_d*: string
    action*: string
    resources*: seq[string]
    save*: Option[seq[string]]
    metadata*: Option[JsonNode]
    source*: Option[PermissionV2Source]

  PermissionSavedInfo* = ref object of RootObj
    id*: string
    project_i_d*: string
    action*: string
    resource*: string

  FileSystemEntry* = ref object of RootObj
    path*: string
    `type`*: string

  CommandV2Info* = ref object of RootObj
    name*: string
    `template`*: string
    description*: Option[string]
    agent*: Option[string]
    model*: Option[ModelRef]
    subtask*: Option[bool]

  SkillV2Info* = ref object of RootObj
    name*: string
    description*: Option[string]
    slash*: Option[bool]
    location*: string
    content*: string

  ModelsDevRefreshed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  IntegrationUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  IntegrationConnectionUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  CatalogUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionCreated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionDeleted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  MessageUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  MessageRemoved* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  MessagePartUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  MessagePartRemoved* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextTextDelta* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextReasoningDelta* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextToolInputDelta* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionNextCompactionDelta* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  MessagePartDelta* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionDiff* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionError* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  InstallationUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  InstallationUpdateAvailable* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  FileEdited* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  ReferenceUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PermissionV2Asked* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PermissionV2Replied* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PluginAdded* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  ProjectDirectoriesUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  FileWatcherUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PtyCreated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PtyUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PtyExited* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PtyDeleted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionV2Asked* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionV2Replied* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionV2Rejected* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  TodoUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  LspUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PermissionAsked* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  PermissionReplied* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  TuiPromptAppend* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  TuiCommandExecute* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  TuiToastShow* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  TuiSessionSelect* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  McpToolsChanged* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  McpBrowserOpenFailed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  CommandExecuted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  ProjectUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionIdle* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionAsked* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  SessionCompacted* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  VcsBranchUpdated* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  WorkspaceReady* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  WorkspaceFailed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  WorkspaceStatus* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  WorktreeReady* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  WorktreeFailed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  ServerConnected* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  GlobalDisposed* = ref object of RootObj
    id*: string
    metadata*: Option[JsonNode]
    `type`*: string
    durable*: Option[JsonNode]
    location*: Option[LocationRef]
    data*: JsonNode

  QuestionV2Request* = ref object of RootObj
    id*: string
    session_i_d*: string
    questions*: seq[QuestionV2Info]
      ## Questions to ask
    tool*: Option[QuestionV2Tool]

  QuestionV2Reply* = ref object of RootObj
    answers*: seq[QuestionV2Answer]
      ## User answers in order of questions (each answer is an array of selected labels)

  ReferenceLocalSource* = ref object of RootObj
    `type`*: string
    path*: string
    description*: Option[string]
    hidden*: Option[bool]

  ReferenceGitSource* = ref object of RootObj
    `type`*: string
    repository*: string
    branch*: Option[string]
    description*: Option[string]
    hidden*: Option[bool]

  ReferenceSource* = ref object of RootObj

  ReferenceInfo* = ref object of RootObj
    name*: string
    path*: string
    description*: Option[string]
    hidden*: Option[bool]
    source*: ReferenceSource

  ProjectCopyCopy* = ref object of RootObj
    directory*: string

  EventModelsDevRefreshed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventIntegrationUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventIntegrationConnectionUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventCatalogUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionCreated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionDeleted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMessageUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMessageRemoved* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMessagePartUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMessagePartRemoved* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextAgentSwitched* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextModelSwitched* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextMoved* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextPrompted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextPromptAdmitted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextContextUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextSynthetic* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextShellStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextShellEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextStepStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextStepEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextStepFailed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextTextStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextTextDelta* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextTextEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextReasoningStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextReasoningDelta* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextReasoningEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolInputStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolInputDelta* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolInputEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolCalled* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolProgress* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolSuccess* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextToolFailed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextRetried* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextCompactionStarted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextCompactionDelta* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextCompactionEnded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextRevertStaged* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextRevertCleared* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionNextRevertCommitted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMessagePartDelta* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionDiff* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionError* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventInstallationUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventInstallationUpdateAvailable* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventFileEdited* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventReferenceUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPermissionV2Asked* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPermissionV2Replied* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPluginAdded* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventProjectDirectoriesUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventFileWatcherUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPtyCreated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPtyUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPtyExited* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPtyDeleted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionV2Asked* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionV2Replied* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionV2Rejected* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventTodoUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventLspUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPermissionAsked* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventPermissionReplied* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMcpToolsChanged* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventMcpBrowserOpenFailed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventCommandExecuted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventProjectUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionStatus* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionIdle* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionAsked* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionReplied* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventQuestionRejected* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventSessionCompacted* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventVcsBranchUpdated* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventWorkspaceReady* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventWorkspaceFailed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventWorkspaceStatus* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventWorktreeReady* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventWorktreeFailed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventServerConnected* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  EventGlobalDisposed* = ref object of RootObj
    id*: string
    `type`*: string
    properties*: JsonNode

  CredentialOAuth* = ref object of RootObj
    `type`*: string
    method_i_d*: string
    refresh*: string
    access*: string
    expires*: int64
    metadata*: Option[JsonNode]

  CredentialKey* = ref object of RootObj
    `type`*: string
    key*: string
    metadata*: Option[JsonNode]

  SkillV2DirectorySource* = ref object of RootObj
    `type`*: string
    path*: string

  SkillV2UrlSource* = ref object of RootObj
    `type`*: string
    url*: string

  SkillV2EmbeddedSource* = ref object of RootObj
    `type`*: string
    skill*: SkillV2Info

  BadRequestError* = ref object of RootObj
    name*: string
    data*: JsonNode
