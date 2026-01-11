# Data Model: Todo Organization Features

## Task Entity

```swift
import Foundation
import SwiftData

@Model
class Task {
    var id: String
    var title: String
    var description: String?
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date
    var dueDate: Date?
    var priority: TaskPriority
    var categories: [String]
    
    init(
        id: String = UUID().uuidString,
        title: String,
        description: String? = nil,
        isCompleted: Bool = false,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        dueDate: Date? = nil,
        priority: TaskPriority = .medium,
        categories: [String] = []
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.dueDate = dueDate
        self.priority = priority
        self.categories = categories
    }
    
    func toggleCompletion() {
        self.isCompleted.toggle()
        self.updatedAt = Date()
    }
    
    func updateTitle(_ newTitle: String) {
        self.title = newTitle
        self.updatedAt = Date()
    }
    
    func updateDescription(_ newDescription: String?) {
        self.description = newDescription
        self.updatedAt = Date()
    }
    
    func updatePriority(_ newPriority: TaskPriority) {
        self.priority = newPriority
        self.updatedAt = Date()
    }
    
    func updateCategories(_ newCategories: [String]) {
        self.categories = newCategories
        self.updatedAt = Date()
    }
    
    func updateDueDate(_ newDueDate: Date?) {
        self.dueDate = newDueDate
        self.updatedAt = Date()
    }
}
```

## TaskPriority Enum

```swift
import Foundation

enum TaskPriority: Int, CaseIterable, Codable {
    case low = 0
    case medium = 1
    case high = 2
    
    var displayName: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    var color: String {
        switch self {
        case .low:
            return "green"
        case .medium:
            return "orange"
        case .high:
            return "red"
        }
    }
}
```

## Filter Entity

```swift
import Foundation

struct TaskFilter: Equatable {
    var statusFilter: StatusFilter = .all
    var priorityFilter: PriorityFilter = .all
    var categoryFilter: CategoryFilter = .all
    
    enum StatusFilter: String, CaseIterable {
        case all = "All"
        case completed = "Completed"
        case pending = "Pending"
        
        var displayName: String { self.rawValue }
    }
    
    enum PriorityFilter: String, CaseIterable {
        case all = "All"
        case high = "High"
        case medium = "Medium"
        case low = "Low"
        
        var displayName: String { self.rawValue }
    }
    
    enum CategoryFilter: String, CaseIterable {
        case all = "All"
        case custom = "Custom"
        
        var displayName: String { self.rawValue }
    }
    
    var isActive: Bool {
        statusFilter != .all || priorityFilter != .all || categoryFilter != .all
    }
    
    func reset() {
        statusFilter = .all
        priorityFilter = .all
        categoryFilter = .all
    }
}
```

## SortOrder Entity

```swift
import Foundation

enum SortOrder: String, CaseIterable {
    case dueDate = "Due Date"
    case priority = "Priority"
    case creationDate = "Creation Date"
    case title = "Title"
    
    var displayName: String { self.rawValue }
    
    var keyPath: KeyPath<Task, Comparable> {
        switch self {
        case .dueDate:
            return \Task.dueDate as! KeyPath<Task, Comparable>
        case .priority:
            return \Task.priority as! KeyPath<Task, Comparable>
        case .creationDate:
            return \Task.createdAt as! KeyPath<Task, Comparable>
        case .title:
            return \Task.title as! KeyPath<Task, Comparable>
        }
    }
}
```

## Validation Rules

- Task title must not be empty
- Priority must be one of the defined values (low, medium, high)
- Categories must be valid strings (no empty strings)
- Due date can be nil or a valid future/past date
- Task ID must be unique

## State Transitions

- Task can transition from pending to completed and vice versa
- Task properties can be updated individually
- Task can be deleted permanently