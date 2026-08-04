
// Environment configuration using zod for validation
const { z } = require("zod");
require("dotenv").config();

// Define a schema for environment variables
const schema = z.object({
  NODE_ENV: z.enum(["development", "test", "production"]).default("development"),
  PORT: z.coerce.number().int().min(1).max(65535).default(4000),
  CORS_ORIGIN: z.string().url().or(z.literal("*")).default("http://localhost:5173"),
  DB_HOST: z.string().default("localhost"),
  DB_PORT: z.coerce.number().int().default(5432),
  DB_NAME: z.string().default("tasktracker"),
  DB_USER: z.string().default("postgres"),
  DB_PASSWORD: z.string().default("postgres")
});

const parsed = schema.safeParse(process.env);

// If the environment variables are invalid, log the errors and exit the process
if (!parsed.success) {
  console.error("Invalid environment variables:", parsed.error.flatten().fieldErrors);
  process.exit(1);
}

module.exports = parsed.data;