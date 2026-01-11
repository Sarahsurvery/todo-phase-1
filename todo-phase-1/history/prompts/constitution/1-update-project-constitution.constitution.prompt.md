---
id: 1
title: "Update Project Constitution"
stage: constitution
date_iso: "2026-01-06"
surface: "agent"
model: "Qwen"
feature: "none"
branch: "main"
user: "user"
command: "/sp.constitution"
labels: ["constitution", "todo-app", "specification"]
links:
  spec: null
  ticket: null
  adr: null
  pr: null
files_yaml:
  - ".specify/memory/constitution.md"
  - ".specify/templates/plan-template.md"
  - ".specify/templates/tasks-template.md"
  - "README.md"
  - "pyproject.toml"
tests_yaml: []
prompt_text: |
  Create or update the project constitution from interactive or provided principle inputs, ensuring all dependent templates stay in sync.
  
  /sp.constitution Key Project Details:
  
  Project Name: Todo In-Memory Python Console App
  Core Concept: A simple command-line todo application that stores tasks only in memory (no file or database persistence).
  Development Approach: Spec-driven using Specify-Kit Plus, with a constitution file and iterative specs in a specs_history folder.
  Technology: UV for project management, Python 3.13+, no external dependencies beyond the core stack.
  Interface: Pure CLI using input() and print(), with intuitive commands and clear output formatting (e.g., status indicators like [ ] or [✓]).
  
  Feature Progression (must be clearly divided into three phases):
  Basic Level (Core Essentials) – Must be fully implemented for Phase I MVP:
  
  Add Task – Create new todo items with title and description.
  Delete Task – Remove tasks from the list by ID.
  Update Task – Modify existing task details (title and/or description) by ID.
  View Task List – Display all tasks with ID, title, description, and completion status indicators.
  Mark as Complete – Toggle task completion status (complete/incomplete) by ID.
  
  Intermediate Level (Organization & Usability) – Planned enhancements for polish:
  
  Due Dates – Add optional due dates to tasks and display them in the list.
  Priorities & Tags/Categories – Assign priority levels (high/medium/low) and/or simple tags (e.g., work, personal).
  Search & Filter – Search tasks by keyword; filter by status, priority, or category.
  Sort Tasks – Sort the displayed list by due date, priority, creation order, or alphabetically.
  
  Advanced Level (Intelligent Features) – Future ambitious extensions:
  
  Recurring Tasks – Support repeating tasks that auto-generate new instances (e.g., daily, weekly).
  Due Dates & Time Reminders – Full date/time support with simulated reminders or overdue indicators.
  
  Constraints:
  
  In-memory storage only; all data is lost when the app exits.
  No GUI, web interface, or external libraries beyond standard Python.
  Project structure: No /src folder; code lives in root alongside constitution and specs_history.
  Clean code: Follow PEP 8, use classes where appropriate (e.g., Task and TodoManager), meaningful names, and basic error handling.
  Hackathon focus: Prioritize completing and polishing the Basic Level.
  
  Not Building in This Phase:
  
  Any form of persistence (files, JSON, database).
  Intermediate or Advanced features unless explicitly added later.
  Unit tests, logging, or complex input parsing libraries.
  
  Success Criteria for Basic Level Completion:
  
  All 5 core features work reliably via CLI.
  Tasks have unique IDs, titles, descriptions, and completion status.
  List view shows clear status indicators and proper formatting.
  App handles invalid inputs gracefully.
  README includes setup instructions (using UV) and usage examples.
response_text: |
  I have successfully updated the project constitution for the Todo In-Memory Python Console App. Here are the key changes and updates:

  ### New Version and Bump Rationale
  - **Version**: Updated from 1.0.0 to 1.0.1 (PATCH version bump)
  - **Rationale**: This is a PATCH update as it includes clarifications and refinements to the existing principles without changing the core governance structure or removing any principles. The changes primarily focus on aligning the constitution with the specific project requirements provided.

  ### Key Changes Made
  1. **Updated Feature Progression**: Clearly defined the three-phase implementation approach (Basic, Intermediate, Advanced levels)
  2. **Project Structure Clarification**: Emphasized that code lives in the root directory, not in a /src folder
  3. **Technology Stack**: Clarified the use of UV for project management and Python 3.13+
  4. **CLI Interface**: Emphasized pure CLI with no external libraries beyond standard Python
  5. **In-Memory Storage**: Clarified the constraints around data persistence

  ### Files Updated for Consistency
  - `.specify/templates/plan-template.md` - Updated to reflect code in root directory
  - `.specify/templates/tasks-template.md` - Updated path conventions to reflect code in root directory
  - `README.md` - Updated to remove reference to /src directory when running the app
  - `pyproject.toml` - Updated entry point to reflect code in root directory

  ### Suggested Commit Message
  ```
  docs: amend constitution to v1.0.1 (align with project requirements and clarify feature progression)
  ```

  All templates and related files have been updated to maintain consistency with the constitution, ensuring that the project follows the specified approach of having code in the root directory rather than in a /src folder, and clearly defining the three-phase feature implementation approach.
outcome: "Constitution successfully updated to v1.0.1 with all dependent templates updated for consistency."
evaluation: "The constitution update was completed successfully with all required changes implemented and dependent files updated for consistency."
---

# Constitution Update for Todo In-Memory Python Console App

This PHR documents the update to the project constitution based on the provided requirements for the Todo In-Memory Python Console App.