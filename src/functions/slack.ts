/**
* Looks up a channel by name and returns the ID
* The performance is horrific in a large workspace
* Keeping the code around for now in case it's useful
* but do not use this in production
*/
export async function findChannelId({
    context,
    client, 
    channelName
}) {
    const cleanedChannelName = channelName.replace(/^#/, '');
    let cursor = null;

    context.log('channelName looking for', cleanedChannelName)

    while (true) {
        const response = await client.conversations.list({
            exclude_archived: true,
            cursor,
        });
        
        if (!response.ok) {
            throw new Error(response);
        }

        const channel = response.channels
            .filter(channel => channel.name === cleanedChannelName)

        if (channel.length > 0) {
            context.log('found channel', channel)
            return channel[0].id
        }
        
        cursor = response.response_metadata.next_cursor;
        if (cursor === "") {
            return undefined;
        }
    }
}
