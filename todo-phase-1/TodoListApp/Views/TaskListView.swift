import SwiftUI

struct TaskListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    
    @State private var searchText = ""
    @State private var showingTaskForm = false
    @State private var selectedSortOrder = SortOrder.creationDate
    @State private var isAscending = true
    @State private var currentFilter = TaskFilter()
    
    var filteredTasks: [Task] {
        var results = tasks
        
        // Apply search
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
        switch selectedSortOrder {
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
        
        return results
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(filteredTasks) { task in
                        TaskRowView(task: task)
                    }
                    .onDelete(perform: deleteTasks)
                }
                .listStyle(PlainListStyle())
            }
            .searchable(text: $searchText, prompt: "Search tasks...")
            .navigationTitle("Tasks")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingTaskForm = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                // Add filter and sort options
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        // Sort options
                        Menu("Sort By", systemImage: "arrow.up.arrow.down") {
                            ForEach(SortOrder.allCases, id: \.self) { order in
                                Button {
                                    selectedSortOrder = order
                                } label: {
                                    HStack {
                                        Text(order.displayName)
                                        if selectedSortOrder == order {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Sort direction
                        Button {
                            isAscending.toggle()
                        } label: {
                            HStack {
                                Text(isAscending ? "Ascending" : "Descending")
                                Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                            }
                        }
                        
                        Divider()
                        
                        // Filter options
                        Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                            // Status filter
                            Menu("Status", systemImage: "tray") {
                                ForEach(TaskFilter.StatusFilter.allCases, id: \.self) { filter in
                                    Button {
                                        currentFilter.statusFilter = filter
                                    } label: {
                                        HStack {
                                            Text(filter.displayName)
                                            if currentFilter.statusFilter == filter {
                                                Image(systemName: "checkmark")
                                            }
                                        }
                                    }
                                }
                            }
                            
                            // Priority filter
                            Menu("Priority", systemImage: "flag") {
                                ForEach(TaskFilter.PriorityFilter.allCases, id: \.self) { filter in
                                    Button {
                                        currentFilter.priorityFilter = filter
                                    } label: {
                                        HStack {
                                            Text(filter.displayName)
                                            if currentFilter.priorityFilter == filter {
                                                Image(systemName: "checkmark")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Reset filters
                        Button("Reset Filters", systemImage: "arrow.clockwise") {
                            currentFilter.reset()
                            searchText = ""
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $showingTaskForm) {
                TaskFormView()
            }
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            let task = filteredTasks[index]
            modelContext.delete(task)
        }
    }
}

struct TaskRowView: View {
    @Bindable var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(task.title)
                        .font(.headline)
                        .strikethrough(task.isCompleted)
                    
                    Spacer()
                    
                    PriorityIndicator(priority: task.priority)
                }
                
                if let description = task.description, !description.isEmpty {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                // Show categories as badges
                if !task.categories.isEmpty {
                    HStack {
                        ForEach(task.categories.prefix(3), id: \.self) { category in
                            CategoryBadge(categoryName: category)
                        }
                        if task.categories.count > 3 {
                            Text("+$(task.categories.count - 3)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 2)
                }
                
                // Show due date if available
                if let dueDate = task.dueDate {
                    HStack {
                        Image(systemName: "calendar")
                            .font(.caption)
                        Text(formatDate(dueDate))
                            .font(.caption)
                            .foregroundColor(dueDate < Date() && !task.isCompleted ? .red : .secondary)
                    }
                    .padding(.top, 2)
                }
            }
            
            Spacer()
        }
        .contentShape(Rectangle()) // Make entire row tappable
        .onTapGesture {
            task.isCompleted.toggle()
        }
        .padding(.vertical, 4)
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

#Preview {
    TaskListView()
}