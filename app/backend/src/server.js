// This is the entry point of the backend server application. It initializes the database and starts the Express server.
const env = require("./config/env");
const app = require("./app");
const { initializeDatabase } = require("./db/init");

const HOST = process.env.HOST || "0.0.0.0";

async function startServer() {
  try {
    await initializeDatabase();

    app.listen(env.PORT, HOST, () => {
      console.log("API is running on http://" + HOST + ":" + env.PORT);
    });
  } catch (error) {
    console.error("Failed to initialize the database:", error);
    process.exit(1);
  }
}

startServer();