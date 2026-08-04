// app.js
// This file is the entry point for the backend application. It sets up the Express server, configures middleware, and defines routes for handling API requests.
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');

const env = require('./config/env');
const healthRoutes = require('./routes/health');
const taskRoutes = require('./routes/tasks');
const { errorHandler } = require('./middleware/error-handler');

const app = express();

// Middleware configuration
app.use(helmet());
app.use(cors({ origin: env.CORS_ORIGIN }));
app.use(express.json({ limit: "100kb" }));
app.use(morgan('dev'));

// Rate limiting configuration
// Limit each IP to 200 requests per 15 minutes
// This helps prevent abuse and ensures fair usage of the API
const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 200,
    standardHeaders: true,
    legacyHeaders: false,
});

// Routes configuration
app.use("/api", limiter);
app.use("/api", healthRoutes);
app.use("/api", taskRoutes);

app.use((req,res) => {
    res.status(404).json({ error: { message: "Not Found" } });
});

app.use(errorHandler);

module.exports = app;