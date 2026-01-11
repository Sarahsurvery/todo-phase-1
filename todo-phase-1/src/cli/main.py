import sys
import os
from typing import Optional

# Add the src directory to the path so we can import from other modules
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from src.services.todo_manager import TodoManager


def main():
    """Main entry point for the todo CLI application."""
    print("Welcome to the Todo CLI App!")
    print("Type 'help' for available commands or 'exit' to quit.")
    
    todo_manager = TodoManager()
    
    while True:
        try:
            # Get user input
            user_input = input("> ").strip()
            
            # Parse the command
            if not user_input:
                continue
                
            parts = user_input.split()
            command = parts[0].lower()
            
            # Handle different commands
            if command in ['exit', 'quit']:
                print("Goodbye!")
                sys.exit(0)
            elif command == 'help':
                show_help()
            elif command == 'add':
                handle_add(todo_manager, parts[1:])
            elif command == 'list' or command == 'ls':
                handle_list(todo_manager)
            elif command == 'complete':
                handle_complete(todo_manager, parts[1:])
            elif command == 'incomplete':
                handle_incomplete(todo_manager, parts[1:])
            elif command == 'delete':
                handle_delete(todo_manager, parts[1:])
            elif command == 'update':
                handle_update(todo_manager, parts[1:])
            else:
                print(f"Unknown command: {command}. Type 'help' for available commands.")
                
        except KeyboardInterrupt:
            print("\nGoodbye!")
            sys.exit(0)
        except EOFError:
            print("\nGoodbye!")
            sys.exit(0)


def show_help():
    """Display help information for available commands."""
    help_text = """
Available commands:
  add <title> [description]        - Add a new task
  list / ls                        - List all tasks
  complete <id>                    - Mark task as complete
  incomplete <id>                  - Mark task as incomplete
  update <id> [title] [description] - Update a task's title and/or description
  delete <id>                      - Delete a task by ID
  help                             - Show this help message
  exit / quit                      - Exit the application
"""
    print(help_text)


def handle_add(todo_manager: TodoManager, args: list):
    """Handle the add command."""
    if len(args) < 1:
        print("Usage: add \"title\" [-d \"description\"]")
        return

    title = args[0].strip('"')

    # Check if there's a description
    description = ""
    if "-d" in args:
        desc_idx = args.index("-d")
        if desc_idx + 1 < len(args):
            description = args[desc_idx + 1].strip('"')

    try:
        task = todo_manager.add_task(title, description)
        print(f"Added task: {task.id} - {task.title}")
    except ValueError as e:
        print(f"Error: {e}")


def handle_list(todo_manager: TodoManager):
    """Handle the list command."""
    tasks = todo_manager.get_all_tasks()

    if not tasks:
        print("No tasks found.")
        return

    print("\nYour tasks:")
    for task in tasks:
        status = "✓" if task.is_complete else "○"
        print(f"  {status} [{task.id}] {task.title}")
        if task.description:
            print(f"      {task.description}")
    print()


def handle_complete(todo_manager: TodoManager, args: list):
    """Handle the complete command."""
    if len(args) < 1:
        print("Usage: complete <id>")
        return
    
    try:
        task_id = int(args[0])
        if todo_manager.mark_complete(task_id):
            print(f"Task {task_id} marked as complete.")
        else:
            print(f"Task {task_id} not found.")
    except ValueError:
        print("Task ID must be a number.")


def handle_incomplete(todo_manager: TodoManager, args: list):
    """Handle the incomplete command."""
    if len(args) < 1:
        print("Usage: incomplete <id>")
        return
    
    try:
        task_id = int(args[0])
        if todo_manager.mark_incomplete(task_id):
            print(f"Task {task_id} marked as incomplete.")
        else:
            print(f"Task {task_id} not found.")
    except ValueError:
        print("Task ID must be a number.")


def handle_delete(todo_manager: TodoManager, args: list):
    """Handle the delete command."""
    if len(args) < 1:
        print("Usage: delete <id>")
        return
    
    try:
        task_id = int(args[0])
        if todo_manager.delete_task(task_id):
            print(f"Task {task_id} deleted.")
        else:
            print(f"Task {task_id} not found.")
    except ValueError:
        print("Task ID must be a number.")


def handle_update(todo_manager: TodoManager, args: list):
    """Handle the update command."""
    if len(args) < 1:
        print("Usage: update <id> [-t \"title\"] [-d \"description\"]")
        return
    
    try:
        task_id = int(args[0])
        
        # Extract title and description if provided
        title = None
        description = None
        
        if "-t" in args:
            title_idx = args.index("-t")
            if title_idx + 1 < len(args):
                title = args[title_idx + 1].strip('"')
        
        if "-d" in args:
            desc_idx = args.index("-d")
            if desc_idx + 1 < len(args):
                description = args[desc_idx + 1].strip('"')
        
        if todo_manager.update_task(task_id, title, description):
            print(f"Task {task_id} updated.")
        else:
            print(f"Task {task_id} not found.")
    except ValueError:
        print("Task ID must be a number.")


if __name__ == "__main__":
    main()