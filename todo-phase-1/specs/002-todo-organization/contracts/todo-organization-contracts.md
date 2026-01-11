# API Contracts: Todo Organization Features

## Overview
This document outlines the API contracts for the new organization features in the Todo List app. Since this is a local iOS application using SwiftData, these contracts represent the internal interfaces and data flow patterns.

## Task Model Extensions

### Task with Priority and Categories
```
GET /tasks
Response:
{
  "id": "string",
  "title": "string",
  "description": "string | null",
  "isCompleted": "boolean",
  "createdAt": "date",
  "updatedAt": "date",
  "dueDate": "date | null",
  "priority": "enum (0: low, 1: medium, 2: high)",
  "categories": "string[]"
}
```

## Task Operations

### Create Task with Priority and Categories
```
POST /tasks
Request:
{
  "title": "string (required)",
  "description": "string | null",
  "priority": "enum (0: low, 1: medium, 2: high) default: 1",
  "categories": "string[] default: []",
  "dueDate": "date | null"
}

Response:
{
  "id": "string",
  "title": "string",
  "description": "string | null",
  "isCompleted": "boolean",
  "createdAt": "date",
  "updatedAt": "date",
  "dueDate": "date | null",
  "priority": "enum (0: low, 1: medium, 2: high)",
  "categories": "string[]"
}
```

### Update Task Priority and Categories
```
PATCH /tasks/{id}
Request:
{
  "title": "string",
  "description": "string | null",
  "isCompleted": "boolean",
  "priority": "enum (0: low, 1: medium, 2: high)",
  "categories": "string[]",
  "dueDate": "date | null"
}

Response:
{
  "id": "string",
  "title": "string",
  "description": "string | null",
  "isCompleted": "boolean",
  "createdAt": "date",
  "updatedAt": "date",
  "dueDate": "date | null",
  "priority": "enum (0: low, 1: medium, 2: high)",
  "categories": "string[]"
}
```

## Search Operations

### Search Tasks
```
GET /tasks/search?q={query}
Query Parameters:
- q: search query string
- status: filter by status (all, completed, pending)
- priority: filter by priority (all, high, medium, low)
- category: filter by category

Response:
{
  "tasks": [
    {
      "id": "string",
      "title": "string",
      "description": "string | null",
      "isCompleted": "boolean",
      "createdAt": "date",
      "updatedAt": "date",
      "dueDate": "date | null",
      "priority": "enum (0: low, 1: medium, 2: high)",
      "categories": "string[]"
    }
  ],
  "total": "number"
}
```

## Filter Operations

### Get Available Filters
```
GET /tasks/filters
Response:
{
  "statusOptions": ["all", "completed", "pending"],
  "priorityOptions": ["all", "high", "medium", "low"],
  "categoryOptions": ["all", ...list of all categories in use]
}
```

## Sort Operations

### Sort Tasks
```
GET /tasks?sortBy={field}&order={asc|desc}
Query Parameters:
- sortBy: field to sort by (dueDate, priority, createdAt, title)
- order: sort order (asc, desc) default: asc

Response:
{
  "tasks": [
    {
      "id": "string",
      "title": "string",
      "description": "string | null",
      "isCompleted": "boolean",
      "createdAt": "date",
      "updatedAt": "date",
      "dueDate": "date | null",
      "priority": "enum (0: low, 1: medium, 2: high)",
      "categories": "string[]"
    }
  ]
}
```