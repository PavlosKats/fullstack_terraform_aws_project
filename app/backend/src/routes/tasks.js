const express = require("express");
const pool = require("../db/pool");

const router = express.Router();

router.get("/tasks", async (req, res, next) => {
  try {
    const result = await pool.query(`
      SELECT
        id,
        title,
        completed,
        created_at AS "createdAt"
      FROM tasks
      ORDER BY created_at DESC
    `);

    res.json(result.rows);
  } catch (error) {
    next(error);
  }
});

router.post("/tasks", async (req, res, next) => {
  const { title } = req.body;

  if (!title || typeof title !== "string" || !title.trim()) {
    return res.status(400).json({
      error: {
        message: "Title is required and must be a non-empty string",
      },
    });
  }

  try {
    const result = await pool.query(
      `
        INSERT INTO tasks (title)
        VALUES ($1)
        RETURNING
          id,
          title,
          completed,
          created_at AS "createdAt"
      `,
      [title.trim()]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    next(error);
  }
});

module.exports = router;