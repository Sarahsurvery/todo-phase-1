import pytest
import sys
import os

# Add the src directory to the path so we can import from other modules
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

from src.models.task import Task


def test_task_creation():
    """Test creating a task with valid data."""
    task = Task(id=1, title="Test Task", description="Test Description", is_complete=False)
    
    assert task.id == 1
    assert task.title == "Test Task"
    assert task.description == "Test Description"
    assert task.is_complete is False


def test_task_creation_defaults():
    """Test creating a task with default values."""
    task = Task(id=1, title="Test Task")
    
    assert task.id == 1
    assert task.title == "Test Task"
    assert task.description == ""
    assert task.is_complete is False


def test_task_title_validation():
    """Test that creating a task with an empty title raises an error."""
    with pytest.raises(ValueError):
        Task(id=1, title="")
    
    with pytest.raises(ValueError):
        Task(id=1, title="   ")