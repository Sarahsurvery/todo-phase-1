import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Task.createdAt) var tasks: [Task]
    
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
}