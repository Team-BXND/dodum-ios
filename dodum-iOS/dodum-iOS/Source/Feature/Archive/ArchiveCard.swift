import SwiftUI

struct ArchiveCard: View {
    var archive: ArchiveModel
    var body: some View {
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
            }
            .padding(20)
        }
        .padding(.top, 16)
    }
}
