// Import the required libraries
import { load } from "js-yaml";
import { readFile } from "fs/promises";
import axios from "axios";

// Define the URL of the YAML file
const url = "https://raw.githubusercontent.com/hmcts/sds-jenkins-config/master/team-config.yml";

// Define the contact_channel name to search for
const contact_channel = "#publishing-and-information";

// Define an async function to read and parse the YAML file
async function readYamlFile(url: string) {
  // Use axios to get the file content from the URL
  const response = await axios.get(url);
  // Use load to convert the YAML content to a TypeScript object
  const data = load(response.data) as Record<string, any>;
  // Return the data object
  return data;
}

// Define a function to fetch the channel_id based on the contact_channel name
function fetchChannelId(data: Record<string, any>, contact_channel: string) {
  // Iterate over the data object
  for (const key in data) {
    // Check if the key is the contact_channel name
    if (data[key].slack.contact_channel === contact_channel) {
      // Return the channel_id property of the data[key] object
      return data[key].slack.channel_id;
    }
  }
  // If no match is found, return null
  return null;
}

// Call the readYamlFile function and pass the URL
readYamlFile(url)
  .then((data) => {
    // Call the fetchChannelId function and pass the data and the contact_channel name
    const channel_id = fetchChannelId(data, contact_channel);
    // Print the result
    console.log(`The channel_id for ${contact_channel} is ${channel_id}`);
  })
  .catch((error) => {
    // Handle any errors
    console.error(error);
  });
