# Todo CLI App

A command-line todo application that manages tasks in memory.

## Setup

1. Ensure Python 3.13+ is installed on your system
2. Install project dependencies using UV:
   ```bash
   uv sync
   ```
   Or if using pip:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

To start the todo application:

```bash
python -m cli.main
```

## Available Commands

- `add "Task title" -d "Optional description"` - Add a new task
- `list` or `ls` - List all tasks
- `update <task_id> -t "New title" -d "New description"` - Update a task
- `complete <task_id>` - Mark a task as complete
- `incomplete <task_id>` - Mark a task as incomplete
- `delete <task_id>` - Delete a task
- `help` or `--help` - Show help information
- `exit` or `quit` - Exit the application