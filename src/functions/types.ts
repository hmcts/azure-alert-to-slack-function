export type AzureMonitorCommonAlertEssentials = {
    alertId: string
    alertRule: string
    severity: string
    signalType: string
    monitorCondition: string
    monitoringService: string
    alertTargetIDs: string[]
    configurationItems: string[]
    originAlertId: string
    firedDateTime: string
    resolvedDateTime: string
    description: string
    essentialsVersion: string
    alertContextVersion: string
}

export type PlatformMetricAlertContext = {
    properties: object
    conditionType: string
    condition: object
}

export type PlatformLogAlertContext = {
    SearchQuery: string
    SearchIntervalStartTimeUtc: string
    SearchIntervalEndtimeUtc: string
    ResultCount: number
    LinkToSearchResults: string
    LinkToFilteredSearchResultsUI: string
    LinkToSearchResultsAPI: string
    LinkToFilteredSearchResultsAPI: string
    SeverityDescription: string
    WorkspaceId: string
    SearchIntervalDurationMin: string
    AffectedConfigurationItems: string[]
    SearchIntervalInMinutes: string
    Threshold: number
    Operator: string
    Dimensions: object[]
    SearchResults: object
    IncludedSearchResults: string
    AlertType: string
}

export type PlatformLogAlertV2Context = {
    properties: object
    conditionType: string
    condition: object
}

export type ActivityAlertAdministrativeContext = {
    authorization: object
    channels: string
    claims: string
    caller: string
    correlationId: string
    eventSource: string
    eventTimestamp: string
    eventDataId: string
    level: string
    operationName: string
    operationId: string
    status: string
    subStatus: string
    submissionTimestamp: string
}

export type ActivityAlertAdministrativePolicyContext = {
    authorization: object
    channels: string
    claims: string
    caller: string
    correlationId: string
    eventSource: string
    eventTimestamp: string
    eventDataId: string
    level: string
    operationName: string
    operationId: string
    properties: object
    status: string
    subStatus: string
    submissionTimestamp: string
}

export type ActivityAlertAutoscaleContext = {
    authorization: object
    channels: string
    claims: string
    caller: string
    correlationId: string
    eventSource: string
    eventTimestamp: string
    eventDataId: string
    level: string
    operationName: string
    operationId: string
    properties: object
    status: string
    subStatus: string
    submissionTimestamp: string
}

export type ActivityAlertServiceHealthContext = {
    authorization: object
    channels: number
    claims: string
    caller: string
    correlationId: string
    eventSource: number
    eventTimestamp: string
    httpRequest: object // unclear what type this is
    eventDataId: string
    level: number
    operationName: string
    operationId: string
    properties: object
    status: string
    subStatus: string
    submissionTimestamp: string
    ResourceType: string // unclear what type this is
}

export type ActivityAlertResourceHealthContext = {
    channels: number
    correlationId: string
    eventSource: number
    eventTimestamp: string
    eventDataId: string
    level: string
    operationName: string
    operationId: string
    properties: object
    status: string
    submissionTimestamp: string
}

export type PrometheusAlertContext = {
    interval: string
    expression: string
    expressionValue: string
    for: string
    labels: object
    annotations: object
    ruleGroup: string
}

export type CustomProperties = {
    [key: string]: string
}

export type AzureMonitorCommonAlertSchema = {
    essentials: AzureMonitorCommonAlertEssentials
    alertContext: PlatformLogAlertContext | PlatformLogAlertV2Context | PlatformMetricAlertContext | ActivityAlertAdministrativeContext | ActivityAlertAdministrativePolicyContext | ActivityAlertAutoscaleContext | ActivityAlertServiceHealthContext | ActivityAlertResourceHealthContext | PrometheusAlertContext
    customProperties: CustomProperties
}

export type AzureMonitorRequest = {
    schemaId: 'azureMonitorCommonAlertSchema'
    data: AzureMonitorCommonAlertSchema
}
