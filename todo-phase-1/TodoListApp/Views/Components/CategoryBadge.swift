import SwiftUI

struct CategoryBadge: View {
    let categoryName: String
    let backgroundColor: Color
    
    init(categoryName: String, backgroundColor: Color = Color.blue) {
        self.categoryName = categoryName
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(categoryName)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor.opacity(0.2))
            .foregroundColor(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(backgroundColor.opacity(0.4), lineWidth: 1)
            )
    }
}

struct CategoryBadge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CategoryBadge(categoryName: "Work")
            CategoryBadge(categoryName: "Personal", backgroundColor: .green)
            CategoryBadge(categoryName: "Urgent", backgroundColor: .red)
        }
        .padding()
    }
}