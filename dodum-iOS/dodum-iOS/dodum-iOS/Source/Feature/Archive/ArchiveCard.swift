import SwiftUI

struct ArchiveCard: View {
    @State private var goToInfo = false
    
    var archive: ArchiveModel
    var body: some View {
        Button(action: {
            goToInfo = true
        }) {
            ZStack {
                Color(/*.fontWhite*/.white)
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
                }
                .padding(20)
            }
            .padding(.top, 16)
            .shadow(radius: 1)
        }
        NavigationLink(destination: Archive(), isActive: $goToInfo) {
            EmptyView()
        }
    }
}
