import { useEffect, useState } from "react";
import axios from "axios";
import "./App.css";

// Create an Axios instance with the base URL from the environment variable
const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
});

// Main App component
// This component manages the state and behavior of the task tracker application
function App() {
  const [tasks, setTasks] = useState([]);
  const [title, setTitle] = useState("");
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState("");

  // Function to load tasks from the API
  async function loadTasks() {
    try {
      setError("");
      const response = await api.get("/tasks");
      setTasks(response.data);
    } catch (err) {
      setError("Failed to load tasks.");
    } finally {
      setLoading(false);
    }
  }

  // Function to handle form submission for creating a new task
  async function handleSubmit(event) {
    event.preventDefault();

    if (!title.trim()) {
      setError("Task title is required.");
      return;
    }

    try {
      setSubmitting(true);
      setError("");
      const response = await api.post("/tasks", {
        title: title.trim(),
      });

      setTasks((currentTasks) => [...currentTasks, response.data]);
      setTitle("");
    } catch (err) {
      setError("Failed to create task.");
    } finally {
      setSubmitting(false);
    }
  }

  // Load tasks when the component mounts
  useEffect(() => {
    loadTasks();
  }, []);

  // Render the main application UI
  return (
    <main className="app-shell">
      <section className="card">
        <p className="eyebrow">Task Tracker</p>
        <h1>Simple task tracking for the AWS portfolio app</h1>
        <p className="intro">
          This frontend talks to the local Express API and will later be deployed
          to S3 and CloudFront.
        </p>

        <form className="task-form" onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Enter a task title"
            value={title}
            onChange={(event) => setTitle(event.target.value)}
            maxLength={120}
          />
          <button type="submit" disabled={submitting}>
            {submitting ? "Adding..." : "Add Task"}
          </button>
        </form>

        {error ? <p className="error-message">{error}</p> : null}

        <div className="task-section">
          <h2>Tasks</h2>

          {loading ? <p>Loading tasks...</p> : null}

          {!loading && tasks.length === 0 ? (
            <p>No tasks yet. Create your first one.</p>
          ) : null}

          {!loading && tasks.length > 0 ? (
            <ul className="task-list">
              {tasks.map((task) => (
                <li key={task.id} className="task-item">
                  <span>{task.title}</span>
                  <small>{new Date(task.createdAt).toLocaleString()}</small>
                </li>
              ))}
            </ul>
          ) : null}
        </div>
      </section>
    </main>
  );
}

export default App;