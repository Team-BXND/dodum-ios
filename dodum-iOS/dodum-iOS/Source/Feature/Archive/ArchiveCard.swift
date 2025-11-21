import SwiftUI

struct ArchiveCard: View {
    @State private var goToInfo = false
    @Environment(\.colorScheme) var colorScheme
    
    var archive: ArchiveModel
    
    var body: some View {
        Button(action: {
            goToInfo = true
        }) {
            ZStack {
                Color(.fontWhite)
                    .frame(maxWidth: 350, maxHeight: 425)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 4) {
                    Image("Sample")
                    
                    HStack {
                        Text(archive.title)
                            .bold()
                            .font(.title)
                            .foregroundColor(.primary)
                        
                        Text(archive.subtitle)
                            .foregroundColor(.secondary)
                    }
                    Text(archive.content)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(20)
            }
            .padding(.top, 16)
            .shadow(
                color: colorScheme == .dark ? .white.opacity(0.2) : .black.opacity(0.2),
                radius: 4,
                x: 0,
                y: 2
            )
        }
        NavigationLink(destination: Archive(), isActive: $goToInfo) {
            EmptyView()
        }
    }
}
