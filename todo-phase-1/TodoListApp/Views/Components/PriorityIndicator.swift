import SwiftUI

struct PriorityIndicator: View {
    let priority: TaskPriority
    
    var body: some View {
        Circle()
            .fill(priorityColor)
            .frame(width: 12, height: 12)
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .accessibilityLabel("Priority: $priority.displayName)")
    }
    
    private var priorityColor: Color {
        switch priority {
        case .high:
            return Color.red
        case .medium:
            return Color.orange
        case .low:
            return Color.green
        }
    }
}

struct PriorityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PriorityIndicator(priority: .high)
            PriorityIndicator(priority: .medium)
            PriorityIndicator(priority: .low)
        }
    }
}