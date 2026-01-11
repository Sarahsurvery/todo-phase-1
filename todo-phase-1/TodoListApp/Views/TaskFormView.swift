import SwiftUI

struct TaskFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var priority: TaskPriority = .medium
    @State private var categoriesText: String = ""
    
    let task: Task?
    
    init(task: Task? = nil) {
        self.task = task
        if let task = task {
            _title = State(initialValue: task.title)
            _description = State(initialValue: task.description ?? "")
            _dueDate = State(initialValue: task.dueDate ?? Date())
            _priority = State(initialValue: task.priority)
            _categoriesText = State(initialValue: task.categories.joined(separator: ", "))
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Task Details") {
                    TextField("Title", text: $title)
                    TextField("Description (Optional)", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                
                Section("Priority") {
                    Picker("Priority", selection: $priority) {
                        ForEach(TaskPriority.allCases, id: \.self) { priority in
                            Text(priority.displayName).tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Categories") {
                    TextField("Comma-separated categories", text: $categoriesText)
                        .onSubmit {
                            // Process categories when user submits
                        }
                }
                
                Section {
                    HStack {
                        Text("Priority Preview:")
                        Spacer()
                        PriorityIndicator(priority: priority)
                        Text(priority.displayName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(task != nil ? "Edit Task" : "New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveTask()
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
    
    private func saveTask() {
        let categories = categoriesText
            .components(separatedBy: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
        
        if let task = task {
            // Update existing task
            task.updateTitle(title)
            task.updateDescription(description.isEmpty ? nil : description)
            task.updateDueDate(dueDate)
            task.updatePriority(priority)
            task.updateCategories(categories)
        } else {
            // Create new task
            let newTask = Task(
                title: title,
                description: description.isEmpty ? nil : description,
                dueDate: dueDate,
                priority: priority,
                categories: categories
            )
            modelContext.insert(newTask)
        }
    }
}

#Preview {
    TaskFormView()
}