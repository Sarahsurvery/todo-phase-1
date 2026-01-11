import pytest
import sys
import os

# Add the src directory to the path so we can import from other modules
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

from src.services.todo_manager import TodoManager
from src.cli.main import handle_add, handle_list
from io import StringIO
from unittest import mock


def test_add_command_integration():
    """Integration test for the add command."""
    manager = TodoManager()
    
    # Simulate adding a task
    handle_add(manager, ['"Test Task"'])
    
    # Verify the task was added
    tasks = manager.get_all_tasks()
    assert len(tasks) == 1
    assert tasks[0].title == "Test Task"
    assert tasks[0].id == 1


def test_add_command_with_description_integration():
    """Integration test for the add command with description."""
    manager = TodoManager()
    
    # Simulate adding a task with description
    handle_add(manager, ['"Test Task"', '-d', '"Test Description"'])
    
    # Verify the task was added with description
    tasks = manager.get_all_tasks()
    assert len(tasks) == 1
    assert tasks[0].title == "Test Task"
    assert tasks[0].description == "Test Description"
    assert tasks[0].id == 1


def test_add_command_output():
    """Test that the add command produces the correct output."""
    manager = TodoManager()
    
    # Capture print output
    captured_output = StringIO()
    original_stdout = sys.stdout
    sys.stdout = captured_output
    
    try:
        handle_add(manager, ['"Test Task"'])
        output = captured_output.getvalue().strip()
        assert "Added task: 1 - Test Task" in output
    finally:
        sys.stdout = original_stdout