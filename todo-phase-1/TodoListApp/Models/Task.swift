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