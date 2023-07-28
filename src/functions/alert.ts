import { ActivityAlertAdministrativeContext, AzureMonitorRequest } from "./types";

export function retrieveText(alert: AzureMonitorRequest) {
    const name = alert.data.essentials.alertRule
    const condition = alert.data.essentials.monitorCondition.toLowerCase()
    const resource = alert.data.essentials.configurationItems[0].split('/').pop().toLowerCase()
    return `${name} was ${condition} for '${resource}'`;
}

// It could be a different type to ActivityAlertAdministrativeContext but for now this is enough
// it just needs to be a type that has a level property
function hasLevel(alertContext): alertContext is ActivityAlertAdministrativeContext {
    return alertContext.level !== undefined;
}

function hasCaller(alertContext): alertContext is ActivityAlertAdministrativeContext {
    return alertContext.caller !== undefined;
}

function hasOperationName(alertContext): alertContext is ActivityAlertAdministrativeContext {
    return alertContext.operationName !== undefined;
}

function getOperation(alert: AzureMonitorRequest) {
    const alertContext = alert.data.alertContext
    if (hasOperationName(alertContext)) {
        const block = {
            "type": "context",
            "elements": [
                {
                    "type": "mrkdwn",
                    "text": `*Operation:* ${alertContext.operationName}`
                }
            ]
        }
        return block
    }
    return undefined
}

function getLevel(alert: AzureMonitorRequest) {
    const alertContext = alert.data.alertContext
    if (hasLevel(alertContext)) {
        const block = {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": `:warning: *Level*: _${alertContext.level}_`
            }
        }

        return block
    }
    return undefined
}

function getResourceType(alert: AzureMonitorRequest) {
    const alertContext = alert.data.alertContext
    if (hasCaller(alertContext)) {
        const resourceType = alertContext.caller

        const block = {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": `:telephone_receiver: *Resource Type*: _${resourceType}_`
            }
        }

        return block
    }

    return undefined
}

function getActions(alert: AzureMonitorRequest) {

    const alertId = alert.data.essentials.alertId
    const viewInAzureLink = `https://portal.azure.com/#blade/Microsoft_Azure_Monitoring/AlertDetailsTemplateBlade/alertId/${encodeURIComponent(alertId)}`

    const actions = {
        "type": "actions",
        "elements": [
            {
                "type": "button",
                "text": {
                    "type": "plain_text",
                    "text": ":Azure: See in Azure",
                    "emoji": true
                },
                "style": "danger",
                "value": "view_in_azure_link",
                // TODO change interaction url to the function rather than https://httpstat.us/200
                "url": viewInAzureLink,
                "action_id": "view_in_azure"
            },
        ]
    }

    if (alert.data.customProperties?.runbookUrl) {
        const runbookUrl = alert.data.customProperties?.runbookUrl

        actions.elements.push({
            "type": "button",
            "text": {
                "type": "plain_text",
                "text": "Runbook",
                "emoji": true
            },
            "style": "primary",
            "value": "runbook_url",
            "url": runbookUrl,
            "action_id": "runbook_url"
        })
    }
    return actions
}

export function retrieveBlocks(alert: AzureMonitorRequest) {
    const name = alert.data.essentials.alertRule
    const condition = alert.data.essentials.monitorCondition.toLowerCase()

    const resource = alert.data.essentials.configurationItems[0]
    const resourceId = alert.data.essentials.alertTargetIDs[0]

    const alertFiredAt = new Intl.DateTimeFormat('en', { dateStyle: 'long', timeStyle: 'long', timeZone: 'Europe/London' })
        .format(new Date(alert.data.essentials.firedDateTime))

    // TODO extract to env var
    const tenantIdOrName = 'HMCTS.NET'
    const resourceIdLink = `https://portal.azure.com/#@${tenantIdOrName}/resource${resourceId}`


    return [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": `*:azuremonitoring: ${name}* was ${condition} for *'${resource}'*`
            }
        },
        {
            "type": "divider"
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": `:fire: *Resource*: _<${resourceIdLink}|${resource}>_`
            }
        },
        getResourceType(alert),
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": `:alarm_clock: *Time*: _${alertFiredAt}_`
            }
        },
        getLevel(alert),
        getActions(alert),
        {
            "type": "divider"
        },
        getOperation(alert),
        {
            "type": "context",
            "elements": [
                {
                    "type": "mrkdwn",
                    "text": `*Resource ID:* ${resourceId}`
                }
            ]
        }
    ].filter(block => block !== undefined)
}
