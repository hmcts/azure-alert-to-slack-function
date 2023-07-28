import { app, HttpRequest, HttpResponseInit, InvocationContext } from "@azure/functions";
import { App } from '@slack/bolt';
import { retrieveBlocks, retrieveText } from "./alert";
import { AzureMonitorRequest } from "./types";

export async function httpTrigger(request: HttpRequest, context: InvocationContext): Promise<HttpResponseInit> {
    context.log(`Http function processed request for url "${request.url}"`);

    const azureMonitorRequest = await request.json() as AzureMonitorRequest

    context.log(JSON.stringify(azureMonitorRequest))

    const app = new App({
        signingSecret: process.env.SLACK_SIGNING_SECRET,
        token: process.env.SLACK_BOT_TOKEN,
    });

    const text = retrieveText(azureMonitorRequest)
    context.log(text)

    const blocks = retrieveBlocks(azureMonitorRequest)
    context.log(JSON.stringify(blocks))

    const channel = azureMonitorRequest.data.customProperties.slackChannelId || 'C05KKMZ85T2' // test-app-insights-fallback

    app.client.chat.postMessage({
        channel,
        text,
        blocks,
    })

    return { body: 'Success' };
};

app.http('httpTrigger', {
    methods: ['POST'],
    authLevel: 'function',
    handler: httpTrigger
});
