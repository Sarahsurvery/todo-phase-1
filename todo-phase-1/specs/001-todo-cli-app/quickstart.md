# Quickstart Guide: Todo CLI App

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
cd src
python -m cli.main
```

Or if you have a packaged executable:
```bash
python -m todo
```

## Available Commands

Once the application is running, you can use the following commands:

### Add a Task
```bash
add "Task title" -d "Optional description"
```
Example:
```bash
add "Buy groceries" -d "Milk, eggs, bread"
```

### List All Tasks
```bash
list
```
or
```bash
ls
```

### Update a Task
```bash
update <task_id> -t "New title" -d "New description"
```
Example:
```bash
update 1 -t "Buy weekly groceries" -d "Milk, eggs, bread, fruits"
```

### Mark Task Complete
```bash
complete <task_id>
```
Example:
```bash
complete 1
```

### Mark Task Incomplete
```bash
incomplete <task_id>
```
Example:
```bash
incomplete 1
```

### Delete a Task
```bash
delete <task_id>
```
Example:
```bash
delete 1
```

### Get Help
```bash
help
```
or
```bash
--help
```

### Exit the Application
```bash
exit
```
or
```bash
quit
```

## Example Workflow

1. Add a task:
   ```
   add "Complete project proposal" -d "Write and review the Q4 project proposal"
   ```

2. View all tasks:
   ```
   list
   ```

3. Mark the task as complete:
   ```
   complete 1
   ```

4. Update the task:
   ```
   update 1 -d "Write, review, and submit the Q4 project proposal"
   ```

5. Exit the application:
   ```
   exit
   ```

## Error Handling

- If you enter an invalid command, the application will display an error message
- If you try to operate on a non-existent task ID, you'll receive an appropriate error message
- If you enter invalid input (e.g., empty title), the application will prompt you to correct it