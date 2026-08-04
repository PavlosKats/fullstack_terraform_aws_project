// Health check route for the task-tracker-api
const express = require('express');
const router = express.Router();

router.get('/health', (req, res) => {
    res.json({
        status: "ok",
        service: "task-tracker-api",
        timestamp: new Date().toISOString()
    });
});

module.exports = router;