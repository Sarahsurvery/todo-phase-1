import Foundation
import SwiftData

@Observable
class TaskViewModel: ObservableObject {
    private var taskDataController: TaskDataController
    
    @Published var tasks: [Task] = []
    @Published var filteredTasks: [Task] = []
    @Published var searchText: String = ""
    @Published var currentFilter: TaskFilter = TaskFilter()
    @Published var currentSortOrder: SortOrder = .creationDate
    @Published var isAscending: Bool = true
    
    init(taskDataController: TaskDataController) {
        self.taskDataController = taskDataController
        self.filteredTasks = self.tasks
    }
    
    // MARK: - Task Management
    
    func loadAllTasks() {
        do {
            tasks = try taskDataController.getAllTasks()
            applyFiltersAndSorting()
        } catch {
            print("Error loading tasks: $error)")
        }
    }
    
    func addTask(
        title: String,
        description: String? = nil,
        dueDate: Date? = nil,
        priority: TaskPriority = .medium,
        categories: [String] = []
    ) {
        do {
            let newTask = try taskDataController.addTask(
                title: title,
                description: description,
                dueDate: dueDate,
                priority: priority,
                categories: categories
            )
            tasks.append(newTask)
            applyFiltersAndSorting()
        } catch {
            print("Error adding task: $error)")
        }
    }
    
    func updateTask(
        _ task: Task,
        title: String? = nil,
        description: String? = nil,
        isCompleted: Bool? = nil,
        dueDate: Date? = nil,
        priority: TaskPriority? = nil,
        categories: [String]? = nil
    ) {
        do {
            var updatedTask = task
            try taskDataController.updateTask(
                task,
                title: title,
                description: description,
                isCompleted: isCompleted,
                dueDate: dueDate,
                priority: priority,
                categories: categories
            )
            
            if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                tasks[index] = updatedTask
            }
            
            applyFiltersAndSorting()
        } catch {
            print("Error updating task: $error)")
        }
    }
    
    func deleteTask(_ task: Task) {
        do {
            try taskDataController.deleteTask(task)
            tasks.removeAll { $0.id == task.id }
            applyFiltersAndSorting()
        } catch {
            print("Error deleting task: $error)")
        }
    }
    
    // MARK: - Search
    
    func updateSearchText(_ text: String) {
        searchText = text
        applyFiltersAndSorting()
    }
    
    // MARK: - Filtering
    
    func updateFilter(_ filter: TaskFilter) {
        currentFilter = filter
        applyFiltersAndSorting()
    }
    
    func resetFilters() {
        currentFilter.reset()
        applyFiltersAndSorting()
    }
    
    // MARK: - Sorting
    
    func updateSortOrder(_ sortOrder: SortOrder, ascending: Bool = true) {
        currentSortOrder = sortOrder
        isAscending = ascending
        applyFiltersAndSorting()
    }
    
    // MARK: - Private Methods
    
    private func applyFiltersAndSorting() {
        var results = tasks
        
        // Apply search filter
        if !searchText.isEmpty {
            results = results.filter { task in
                task.title.localizedCaseInsensitiveContains(searchText) ||
                (task.description?.localizedCaseInsensitiveContains(searchText) ?? false)
            }
        }
        
        // Apply status filter
        if currentFilter.statusFilter != .all {
            switch currentFilter.statusFilter {
            case .completed:
                results = results.filter { $0.isCompleted }
            case .pending:
                results = results.filter { !$0.isCompleted }
            default:
                break
            }
        }
        
        // Apply priority filter
        if currentFilter.priorityFilter != .all {
            switch currentFilter.priorityFilter {
            case .high:
                results = results.filter { $0.priority == .high }
            case .medium:
                results = results.filter { $0.priority == .medium }
            case .low:
                results = results.filter { $0.priority == .low }
            default:
                break
            }
        }
        
        // Apply sorting
        switch currentSortOrder {
        case .dueDate:
            results.sort { task1, task2 in
                let date1 = task1.dueDate ?? Date.distantFuture
                let date2 = task2.dueDate ?? Date.distantFuture
                return isAscending ? date1 < date2 : date1 > date2
            }
        case .priority:
            results.sort { task1, task2 in
                return isAscending ? task1.priority.rawValue < task2.priority.rawValue : 
                                  task1.priority.rawValue > task2.priority.rawValue
            }
        case .creationDate:
            results.sort { task1, task2 in
                return isAscending ? task1.createdAt < task2.createdAt : 
                                  task1.createdAt > task2.createdAt
            }
        case .title:
            results.sort { task1, task2 in
                return isAscending ? task1.title < task2.title : 
                                  task1.title > task2.title
            }
        }
        
        filteredTasks = results
    }
    
    // MARK: - Helper Methods
    
    func toggleTaskCompletion(_ task: Task) {
        updateTask(task, isCompleted: !task.isCompleted)
    }
}