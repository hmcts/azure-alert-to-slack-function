import { app, HttpRequest, HttpResponseInit, InvocationContext } from "@azure/functions";
import { App } from '@slack/bolt';
import { retrieveBlocks, retrieveText } from "./alert";
import { AzureMonitorRequest } from "./types";
import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { ManagedIdentityCredential } from "@azure/identity"
import { SecretClient } from "@azure/keyvault-secrets"

export async function httpTrigger(request: HttpRequest, context: InvocationContext): Promise<HttpResponseInit> {
    context.log(`Http function processed request for url "${request.url}"`);

    const azureMonitorRequest = await request.json() as AzureMonitorRequest

    context.log(JSON.stringify(azureMonitorRequest))

    const vaultName = process.env.KEY_VAULT_NAME;
    const url = `https://${vaultName}.vault.azure.net`;
    const credential = new ManagedIdentityCredential();
    const client = new SecretClient(url, credential);
    const botTokenSecretName = process.env.BOT_TOKEN_SECRET_NAME
    const botToken = await client.getSecret(botTokenSecretName);
    const signingSecretName = process.env.SIGNING_SECRET_NAME
    const signingSecret = await client.getSecret(signingSecretName);

    const app = new App({
        signingSecret: signingSecret.value,
        token: botToken.value,
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
