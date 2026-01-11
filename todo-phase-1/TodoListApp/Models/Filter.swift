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