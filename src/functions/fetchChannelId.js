"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
// Import the required libraries
var js_yaml_1 = require("js-yaml");
var axios_1 = require("axios");
// Define the URL of the YAML file
var url = "https://raw.githubusercontent.com/hmcts/sds-jenkins-config/master/team-config.yml";
// Define the contact_channel name to search for
var contact_channel = "#publishing-and-information";
// Define an async function to read and parse the YAML file
function readYamlFile(url) {
    return __awaiter(this, void 0, void 0, function () {
        var response, data;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, axios_1.default.get(url)];
                case 1:
                    response = _a.sent();
                    data = (0, js_yaml_1.load)(response.data);
                    // Return the data object
                    return [2 /*return*/, data];
            }
        });
    });
}
// Define a function to fetch the channel_id based on the contact_channel name
function fetchChannelId(data, contact_channel) {
    // Iterate over the data object
    for (var key in data) {
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
    .then(function (data) {
    // Call the fetchChannelId function and pass the data and the contact_channel name
    var channel_id = fetchChannelId(data, contact_channel);
    // Print the result
    console.log("The channel_id for ".concat(contact_channel, " is ").concat(channel_id));
})
    .catch(function (error) {
    // Handle any errors
    console.error(error);
});
