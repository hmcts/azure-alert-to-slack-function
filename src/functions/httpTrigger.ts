import { app, HttpRequest, HttpResponseInit, InvocationContext } from "@azure/functions";
import { App } from '@slack/bolt';
import { blocks, text } from "./alert";

export async function httpTrigger(request: HttpRequest, context: InvocationContext): Promise<HttpResponseInit> {
    context.log(`Http function processed request for url "${request.url}"`);

    const name = request.query.get('name') || await request.text() || 'world';

    const app = new App({
        signingSecret: process.env.SLACK_SIGNING_SECRET,
        token: process.env.SLACK_BOT_TOKEN,
    });

    app.client.chat.postMessage({
        channel: 'C05KAG00K1N',
        text: text(),
        blocks: blocks()
    })

    return { body: `Hello, ${name}!` };
};

app.http('httpTrigger', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: httpTrigger
});
