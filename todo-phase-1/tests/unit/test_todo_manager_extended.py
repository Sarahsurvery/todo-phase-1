import pytest
import sys
import os

# Add the src directory to the path so we can import from other modules
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

from src.models.task import Task
from src.services.todo_manager import TodoManager


def test_delete_task():
    """Test deleting a task from the todo manager."""
    manager = TodoManager()
    
    # Add a task
    task = manager.add_task("Test Task")
    task_id = task.id
    
    # Verify task exists
    assert len(manager.tasks) == 1
    assert manager.get_task_by_id(task_id) is not None
    
    # Delete the task
    result = manager.delete_task(task_id)
    
    # Verify the task was deleted
    assert result is True
    assert len(manager.tasks) == 0
    assert manager.get_task_by_id(task_id) is None


def test_delete_nonexistent_task():
    """Test deleting a task that doesn't exist."""
    manager = TodoManager()
    
    # Try to delete a non-existent task
    result = manager.delete_task(999)
    
    # Should return False
    assert result is False


def test_update_task():
    """Test updating a task's title and description."""
    manager = TodoManager()
    
    # Add a task
    task = manager.add_task("Old Title", "Old Description")
    task_id = task.id
    
    # Update the task
    result = manager.update_task(task_id, "New Title", "New Description")
    
    # Verify the update
    assert result is True
    updated_task = manager.get_task_by_id(task_id)
    assert updated_task.title == "New Title"
    assert updated_task.description == "New Description"


def test_update_task_partial():
    """Test updating only the title or description of a task."""
    manager = TodoManager()
    
    # Add a task
    task = manager.add_task("Old Title", "Old Description")
    task_id = task.id
    
    # Update only the title
    result = manager.update_task(task_id, title="New Title")
    
    # Verify the update
    assert result is True
    updated_task = manager.get_task_by_id(task_id)
    assert updated_task.title == "New Title"
    assert updated_task.description == "Old Description"  # Should remain unchanged


def test_update_nonexistent_task():
    """Test updating a task that doesn't exist."""
    manager = TodoManager()
    
    # Try to update a non-existent task
    result = manager.update_task(999, "New Title")
    
    # Should return False
    assert result is False


def test_mark_complete():
    """Test marking a task as complete."""
    manager = TodoManager()
    
    # Add a task
    task = manager.add_task("Test Task")
    task_id = task.id
    
    # Mark as complete
    result = manager.mark_complete(task_id)
    
    # Verify the task is marked complete
    assert result is True
    updated_task = manager.get_task_by_id(task_id)
    assert updated_task.is_complete is True


def test_mark_incomplete():
    """Test marking a task as incomplete."""
    manager = TodoManager()
    
    # Add a task and mark it complete
    task = manager.add_task("Test Task")
    task_id = task.id
    manager.mark_complete(task_id)
    
    # Verify it's complete
    assert manager.get_task_by_id(task_id).is_complete is True
    
    # Mark as incomplete
    result = manager.mark_incomplete(task_id)
    
    # Verify the task is marked incomplete
    assert result is True
    updated_task = manager.get_task_by_id(task_id)
    assert updated_task.is_complete is False


def test_get_task_by_id():
    """Test getting a task by its ID."""
    manager = TodoManager()
    
    # Add a task
    task = manager.add_task("Test Task")
    task_id = task.id
    
    # Get the task by ID
    retrieved_task = manager.get_task_by_id(task_id)
    
    # Verify the task
    assert retrieved_task is not None
    assert retrieved_task.id == task_id
    assert retrieved_task.title == "Test Task"


def test_get_nonexistent_task_by_id():
    """Test getting a task that doesn't exist."""
    manager = TodoManager()
    
    # Try to get a non-existent task
    retrieved_task = manager.get_task_by_id(999)
    
    # Should return None
    assert retrieved_task is None