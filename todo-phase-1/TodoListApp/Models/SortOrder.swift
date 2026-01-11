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