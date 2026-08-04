const express = require('express');
const router = express.Router();

// In-memory task storage for demonstration purposes
const tasks = [];

router.get("/tasks", (req, res) => {
    res.json(tasks);
});

// Additional routes for creating, updating, and deleting tasks can be added here
router.post("/tasks", (req, res) => {
    const { title } = req.body;

    if (!title || typeof title !== "string") {
        return res.status(400).json({ error: { message: "Title is required and must be a string" } });
    }

    const newTask = {
        id: tasks.length + 1,
        title: title.trim(),
        completed: false,
        createdAt: new Date().toISOString()
    };

    tasks.push(newTask);
    res.status(201).json(newTask);
});

module.exports = router;