import pytest
import sys
import os

# Add the src directory to the path so we can import from other modules
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

from src.models.task import Task
from src.services.todo_manager import TodoManager


def test_add_task():
    """Test adding a task to the todo manager."""
    manager = TodoManager()
    
    task = manager.add_task("Test Task", "Test Description")
    
    assert task.id == 1
    assert task.title == "Test Task"
    assert task.description == "Test Description"
    assert task.is_complete is False
    assert len(manager.tasks) == 1
    assert manager.tasks[0] == task


def test_add_task_without_description():
    """Test adding a task without a description."""
    manager = TodoManager()
    
    task = manager.add_task("Test Task")
    
    assert task.id == 1
    assert task.title == "Test Task"
    assert task.description == ""
    assert task.is_complete is False


def test_add_multiple_tasks():
    """Test adding multiple tasks with auto-incrementing IDs."""
    manager = TodoManager()
    
    task1 = manager.add_task("First Task")
    task2 = manager.add_task("Second Task")
    
    assert task1.id == 1
    assert task2.id == 2
    assert len(manager.tasks) == 2
    assert manager.next_id == 3