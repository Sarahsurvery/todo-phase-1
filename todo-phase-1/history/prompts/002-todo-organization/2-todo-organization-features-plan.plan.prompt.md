---
id: 2
title: "Todo Organization Features Plan"
stage: plan
date_iso: "2026-01-06"
surface: "agent"
model: "Qwen"
feature: "todo-organization"
branch: "002-todo-organization"
user: "user"
command: "/sp.plan"
labels: ["planning", "todo-app", "organization", "features"]
links:
  spec: "specs/002-todo-organization/spec.md"
  plan: "specs/002-todo-organization/plan.md"
  ticket: null
  adr: null
  pr: null
files_yaml:
  - "specs/002-todo-organization/plan.md"
  - "specs/002-todo-organization/research.md"
  - "specs/002-todo-organization/data-model.md"
  - "specs/002-todo-organization/quickstart.md"
  - "specs/002-todo-organization/contracts/todo-organization-contracts.md"
tests_yaml: []
prompt_text: |
  Execute the implementation planning workflow using the plan template to generate design artifacts.
  
  User Input:
  
  /sp.plan You are a senior iOS engineer and product-minded architect, expert in SwiftUI (iOS 17+), SwiftData, and Apple Human Interface Guidelines.
  
  We are building a production-quality Todo List app incrementally using SwiftUI.
  
  ========================
  CURRENT STATE (ALREADY DONE)
  ========================
  The app already has:
  - A basic Todo List app
  - Task CRUD (Create, Read, Update, Delete)
  - SwiftUI List-based UI
  - Add/Edit Task sheet
  - Mark task as completed
  - Local persistence using SwiftData (preferred) or Core Data
  - Clean, working baseline app
  
  No advanced features are implemented yet.
  
  ========================
  GOAL: INTERMEDIATE LEVEL
  ========================
  We now want to implement **Intermediate-Level features focused on Organization & Usability**, making the app feel polished, practical, and close to a real App Store-quality product.
  
  ========================
  FEATURES TO IMPLEMENT (IN ORDER)
  ========================
  
  ### Feature 2: Priorities & Categories (FIRST)
  - Add priority levels: High, Medium, Low
  - Add categories/tags (e.g. Work, Home, Personal)
  - Store both priority and category in the Task model
  - Show visual indicators in the task list:
    - Colors or icons for priority
    - Badges or labels for categories
  - Allow selecting priority and category when creating/editing a task
  
  ### Feature 3: Search & Filters
  - Add a search bar using `.searchable`
  - Search tasks by title and notes
  - Add filters for:
    - Status: All / Completed / Pending
    - Priority
    - Category
  - Filters should be easy to toggle and feel natural in the UI
  
  ### Feature 4: Sorting
  - Allow sorting tasks by:
    - Due date
    - Priority
    - Creation date
    - Alphabetical order
  - Use a toolbar menu or picker for sorting
  - Sorting logic should be clean and maintainable
  
  ========================
  STRICT RULES FOR YOUR RESPONSES
  ========================
  1. Work **incrementally** — implement ONE feature at a time
  2. Before coding:
     - Explain a short plan (model changes, UI changes, logic)
  3. Provide ONLY:
     - Modified or newly added files
     - Full file contents
     - Wrapped in Markdown code blocks with filenames
  4. Use **SwiftData** for persistence (unless the current code already uses something else)
  5. Keep UI:
     - Modern SwiftUI
     - Clean and minimal
     - Use `.searchable`, `ToolbarItem`, `Menu`, `Picker`
  6. Use visual indicators:
     - Priority colors/icons
     - Category badges
  7. Do NOT add:
     - Notifications
     - Reminders
     - Subtasks
     - Cloud sync
  8. After each feature:
     - Briefly explain what was added
     - Explain how to manually test it
  9. STOP and ask for confirmation before moving to the next feature
  
  ========================
  IMPORTANT
  ========================
  DO NOT assume my existing code structure.
  
  FIRST STEP:
  Ask me to paste my current key files, such as:
  - Task model
  - Main list view (ContentView or equivalent)
  - ViewModel (if any)
  - Add/Edit task view
  
  After I paste the code:
  ➡️ Start with **Feature 2: Priorities & Categories only**
  ➡️ Implement it fully and cleanly
  ➡️ Wait for my confirmation before continuing
  
  Think carefully. Write production-quality SwiftUI code.
response_text: |
  Created implementation plan for the Todo Organization features including:
  
  1. Updated implementation plan (plan.md) with iOS-specific details
  2. Research document (research.md) with technical decisions
  3. Data model (data-model.md) with extended Task model
  4. Quickstart guide (quickstart.md) for developers
  5. API contracts (contracts/todo-organization-contracts.md) for the new features
  
  The plan addresses all three features (Priorities & Categories, Search & Filter, and Sort) with appropriate technical context for iOS/SwiftUI/SwiftData implementation.
outcome: "Successfully created implementation plan for todo organization features"
evaluation: "The implementation plan is complete with all required artifacts and ready for the next phase of development"
---

# Todo Organization Features Implementation Plan

This PHR documents the creation of the implementation plan for intermediate level features of the iOS Todo List app, including priorities & tags/categories, search & filter, and sort tasks functionality.