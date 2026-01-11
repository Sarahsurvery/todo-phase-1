from typing import List, Optional
from ..models.task import Task


class TodoManager:
    """
    Manages the collection of tasks in the todo application.
    
    Attributes:
        tasks: List of all tasks in memory
        next_id: Next available ID for new tasks (starts at 1)
    """
    
    def __init__(self):
        """Initialize the TodoManager with an empty task list and ID counter."""
        self.tasks: List[Task] = []
        self.next_id: int = 1

    def add_task(self, title: str, description: str = "") -> Task:
        """
        Creates and adds a new task.

        Args:
            title: Title of the task
            description: Optional description of the task

        Returns:
            The newly created Task object
        """
        task = Task(id=self.next_id, title=title, description=description)
        self.tasks.append(task)
        self.next_id += 1
        return task

    def _validate_task_id(self, task_id: int) -> bool:
        """
        Validates that a task ID is a positive integer.

        Args:
            task_id: ID to validate

        Returns:
            True if valid, False otherwise
        """
        return isinstance(task_id, int) and task_id > 0

    def delete_task(self, task_id: int) -> bool:
        """
        Deletes a task by ID.
        
        Args:
            task_id: ID of the task to delete
            
        Returns:
            True if the task was found and deleted, False otherwise
        """
        for i, task in enumerate(self.tasks):
            if task.id == task_id:
                del self.tasks[i]
                return True
        return False

    def update_task(self, task_id: int, title: Optional[str] = None, description: Optional[str] = None) -> bool:
        """
        Updates task fields.
        
        Args:
            task_id: ID of the task to update
            title: New title (optional)
            description: New description (optional)
            
        Returns:
            True if the task was found and updated, False otherwise
        """
        for task in self.tasks:
            if task.id == task_id:
                if title is not None:
                    task.title = title
                if description is not None:
                    task.description = description
                return True
        return False

    def get_all_tasks(self) -> List[Task]:
        """
        Returns all tasks.
        
        Returns:
            List of all Task objects
        """
        return self.tasks.copy()

    def mark_complete(self, task_id: int) -> bool:
        """
        Marks task as complete.
        
        Args:
            task_id: ID of the task to mark complete
            
        Returns:
            True if the task was found and marked complete, False otherwise
        """
        for task in self.tasks:
            if task.id == task_id:
                task.is_complete = True
                return True
        return False

    def mark_incomplete(self, task_id: int) -> bool:
        """
        Marks task as incomplete.
        
        Args:
            task_id: ID of the task to mark incomplete
            
        Returns:
            True if the task was found and marked incomplete, False otherwise
        """
        for task in self.tasks:
            if task.id == task_id:
                task.is_complete = False
                return True
        return False

    def get_task_by_id(self, task_id: int) -> Optional[Task]:
        """
        Returns a task by its ID.
        
        Args:
            task_id: ID of the task to retrieve
            
        Returns:
            Task object if found, None otherwise
        """
        for task in self.tasks:
            if task.id == task_id:
                return task
        return None