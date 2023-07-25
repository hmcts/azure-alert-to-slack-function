export function text() {
    return "Application Insights daily cap reached was activated for 'PLATOPS-SANDBOX'";
}


export function blocks() {
    return [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": "*:azuremonitoring: Application Insights daily cap reached* was activated for *'PLATOPS-SANDBOX'*"
            }
        },
        {
            "type": "divider"
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":spiral_note_pad: *Resource*: _PLATOPS-SANDBOX_"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":telephone_receiver: *Resource Type*: _Application Insights_"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":key: *Subscription*: _DCD-CFT-Sandbox_"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":warning: *Level*: _Warning_"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":clock1: *Time*: _July 25, 2023 9:34 UTC_"
            }
        },
        {
            "type": "context",
            "elements": [
                {
                    "type": "mrkdwn",
                    "text": "*Operation:* Microsoft.Insights/Components/DailyCapReached/Action"
                }
            ]
        }
    ]
}
