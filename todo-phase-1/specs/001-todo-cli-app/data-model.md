# Data Model: Todo CLI App

## Task Entity

### Attributes
- **id**: `int` - Unique identifier for the task (auto-incremented)
- **title**: `str` - Required title of the task (non-empty)
- **description**: `str` - Optional description of the task (can be empty)
- **is_complete**: `bool` - Completion status of the task (default: False)

### Validation Rules
- Title must not be empty or contain only whitespace
- ID must be unique within the system
- ID must be a positive integer

### State Transitions
- `incomplete` → `complete`: When user marks task as complete
- `complete` → `incomplete`: When user marks task as incomplete

## TodoManager Entity

### Attributes
- **tasks**: `List[Task]` - Collection of all tasks in memory
- **next_id**: `int` - Next available ID for new tasks (starts at 1)

### Operations
- `add_task(title: str, description: str = "")` → `Task`: Creates and adds a new task
- `delete_task(task_id: int)` → `bool`: Deletes a task by ID, returns success status
- `update_task(task_id: int, title: str = None, description: str = None)` → `bool`: Updates task fields, returns success status
- `get_all_tasks()` → `List[Task]`: Returns all tasks
- `mark_complete(task_id: int)` → `bool`: Marks task as complete, returns success status
- `mark_incomplete(task_id: int)` → `bool`: Marks task as incomplete, returns success status
- `get_task_by_id(task_id: int)` → `Optional[Task]`: Returns task or None if not found