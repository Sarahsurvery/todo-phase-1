import Foundation
import SwiftData

@MainActor
class TaskDataController {
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func addTask(
        title: String,
        description: String? = nil,
        dueDate: Date? = nil,
        priority: TaskPriority = .medium,
        categories: [String] = []
    ) throws -> Task {
        let task = Task(
            title: title,
            description: description,
            dueDate: dueDate,
            priority: priority,
            categories: categories
        )
        
        modelContext.insert(task)
        try modelContext.save()
        
        return task
    }
    
    func updateTask(
        _ task: Task,
        title: String? = nil,
        description: String? = nil,
        isCompleted: Bool? = nil,
        dueDate: Date? = nil,
        priority: TaskPriority? = nil,
        categories: [String]? = nil
    ) throws {
        if let title = title {
            task.updateTitle(title)
        }
        
        if let description = description {
            task.updateDescription(description)
        }
        
        if let isCompleted = isCompleted {
            task.isCompleted = isCompleted
            task.updatedAt = Date()
        }
        
        if let dueDate = dueDate {
            task.updateDueDate(dueDate)
        }
        
        if let priority = priority {
            task.updatePriority(priority)
        }
        
        if let categories = categories {
            task.updateCategories(categories)
        }
        
        try modelContext.save()
    }
    
    func deleteTask(_ task: Task) throws {
        modelContext.delete(task)
        try modelContext.save()
    }
    
    func getAllTasks() throws -> [Task] {
        let descriptor = FetchDescriptor<Task>(sortBy: [SortDescriptor(\Task.createdAt, order: .forward)])
        return try modelContext.fetch(descriptor)
    }
    
    func searchTasks(query: String) throws -> [Task] {
        let descriptor = FetchDescriptor<Task>(
            predicate: #Predicate { task in
                task.title.localizedCaseInsensitiveContains(query) ||
                (task.description?.localizedCaseInsensitiveContains(query) ?? false)
            },
            sortBy: [SortDescriptor(\Task.createdAt, order: .forward)]
        )
        return try modelContext.fetch(descriptor)
    }
    
    func getTasksWithFilter(_ filter: TaskFilter) throws -> [Task] {
        var tasks = try getAllTasks()
        
        // Apply status filter
        if filter.statusFilter != .all {
            switch filter.statusFilter {
            case .completed:
                tasks = tasks.filter { $0.isCompleted }
            case .pending:
                tasks = tasks.filter { !$0.isCompleted }
            default:
                break
            }
        }
        
        // Apply priority filter
        if filter.priorityFilter != .all {
            switch filter.priorityFilter {
            case .high:
                tasks = tasks.filter { $0.priority == .high }
            case .medium:
                tasks = tasks.filter { $0.priority == .medium }
            case .low:
                tasks = tasks.filter { $0.priority == .low }
            default:
                break
            }
        }
        
        // Apply category filter
        if filter.categoryFilter != .all {
            // For simplicity, we're not implementing specific category filtering
            // This would require more complex logic to handle specific category selection
        }
        
        return tasks
    }
    
    func getTasksSorted(by sortOrder: SortOrder, ascending: Bool = true) throws -> [Task] {
        let sortDescriptor: SortDescriptor<Task>
        
        switch sortOrder {
        case .dueDate:
            sortDescriptor = SortDescriptor(\Task.dueDate, order: ascending ? .forward : .reverse)
        case .priority:
            sortDescriptor = SortDescriptor(\Task.priority.rawValue, order: ascending ? .forward : .reverse)
        case .creationDate:
            sortDescriptor = SortDescriptor(\Task.createdAt, order: ascending ? .forward : .reverse)
        case .title:
            sortDescriptor = SortDescriptor(\Task.title, order: ascending ? .forward : .reverse)
        }
        
        let descriptor = FetchDescriptor<Task>(sortBy: [sortDescriptor])
        return try modelContext.fetch(descriptor)
    }
}