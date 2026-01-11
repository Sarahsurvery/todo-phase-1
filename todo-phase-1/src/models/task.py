from dataclasses import dataclass
from typing import Optional


@dataclass
class Task:
    """
    Represents a task in the todo application.

    Attributes:
        id: Unique identifier for the task
        title: Title of the task (required)
        description: Optional description of the task
        is_complete: Completion status of the task (default: False)
    """
    id: int
    title: str
    description: str = ""
    is_complete: bool = False

    def __post_init__(self):
        """Validate the task after initialization."""
        if not self.title.strip():
            raise ValueError("Title cannot be empty or contain only whitespace")
        if self.id <= 0:
            raise ValueError("ID must be a positive integer")