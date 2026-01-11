# Quickstart Guide: Todo Organization Features

## Getting Started

This guide will help you set up and understand the Todo List app with organization features (priorities, categories, search, filter, and sort).

## Project Structure

The project follows the MVVM (Model-View-ViewModel) pattern with SwiftData for persistence:

```
TodoListApp/
├── Models/
│   ├── Task.swift          # Enhanced Task model with priority and categories
│   └── TaskPriority.swift  # Priority enum with display properties
├── Views/
│   ├── ContentView.swift
│   ├── TaskListView.swift  # Main list with search, filter, and sort
│   ├── TaskFormView.swift  # Add/edit task with priority/category selection
│   └── Components/
│       ├── PriorityIndicator.swift  # Visual indicator for priority
│       └── CategoryBadge.swift      # Badge for categories
├── ViewModels/
│   └── TaskViewModel.swift # Handles business logic and data operations
└── Data/
    └── TaskDataController.swift # SwiftData operations
```

## Key Features Implementation

### 1. Priorities & Categories
- Tasks now have a `priority` property (High, Medium, Low)
- Tasks have a `categories` array for multiple tags
- Visual indicators show priority (color coding) and categories (badges)

### 2. Search
- Implemented using SwiftUI's `.searchable` modifier
- Searches in task title and description fields

### 3. Filter
- Filter by status (All, Completed, Pending)
- Filter by priority (All, High, Medium, Low)
- Filter by category (All, or specific category)

### 4. Sort
- Sort by due date, priority, creation date, or title
- Implemented with a toolbar menu for easy switching

## Running the Project

1. Open the project in Xcode
2. Select your target device/simulator
3. Build and run (Cmd+R)

## Key Implementation Details

### Task Model Changes
The Task model has been extended with:
- `priority`: TaskPriority enum (low, medium, high)
- `categories`: [String] array for multiple categories
- Additional methods to update these properties

### UI Components
- `PriorityIndicator`: Shows color-coded priority indicator
- `CategoryBadge`: Displays category as a styled badge
- Enhanced `TaskFormView`: Allows setting priority and categories

### Data Handling
- SwiftData schema updated to include new properties
- Filtering and sorting logic implemented in TaskViewModel
- Search functionality integrated into the main task list

## Testing the Features

1. **Adding Priority & Categories**:
   - Create a new task
   - Select a priority level (High/Medium/Low)
   - Add one or more categories
   - Verify visual indicators appear in the list

2. **Search**:
   - Type in the search bar
   - Verify only matching tasks are displayed
   - Clear search to see all tasks again

3. **Filter**:
   - Apply different filters (status, priority, category)
   - Verify only matching tasks are displayed
   - Clear filters to see all tasks again

4. **Sort**:
   - Select different sorting options
   - Verify the task list reorders accordingly