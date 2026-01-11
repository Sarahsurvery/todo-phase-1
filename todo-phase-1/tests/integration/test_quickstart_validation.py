def test_quickstart_workflow():
    """Test the example workflow from the quickstart guide."""
    from src.services.todo_manager import TodoManager
    from src.cli.main import handle_add, handle_list, handle_complete, handle_update
    
    # Create a todo manager
    manager = TodoManager()
    
    # 1. Add a task: add "Complete project proposal" -d "Write and review the Q4 project proposal"
    handle_add(manager, ['"Complete project proposal"', '-d', '"Write and review the Q4 project proposal"'])
    
    # Verify the task was added
    tasks = manager.get_all_tasks()
    assert len(tasks) == 1
    task = tasks[0]
    assert task.title == "Complete project proposal"
    assert task.description == "Write and review the Q4 project proposal"
    assert task.is_complete is False
    
    # 2. View all tasks: list
    # (We can't easily test the output of handle_list since it prints to console)
    tasks = manager.get_all_tasks()
    assert len(tasks) == 1
    
    # 3. Mark the task as complete: complete 1
    result = manager.mark_complete(1)
    assert result is True
    assert manager.get_task_by_id(1).is_complete is True
    
    # 4. Update the task: update 1 -d "Write, review, and submit the Q4 project proposal"
    result = manager.update_task(1, description="Write, review, and submit the Q4 project proposal")
    assert result is True
    assert manager.get_task_by_id(1).description == "Write, review, and submit the Q4 project proposal"
    
    print("Quickstart workflow test passed!")


if __name__ == "__main__":
    test_quickstart_workflow()