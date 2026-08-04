// Entry point for the Express.js server
const env = require("./config/env");
const app = require("./app");

const HOST = process.env.HOST || "0.0.0.0";

// Start the server and listen on the specified port and host
app.listen(env.PORT, HOST, () => {
    console.log(" API is running on http://" + HOST + ":" + env.PORT);
});