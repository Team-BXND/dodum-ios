import SwiftUI

struct RallyInfoCard: View {
    var title: String = "제목"
    var place: String = "장소"
    var target: String = "대상"
    var date: String = "일시"
    @State private var goToInfo = false
    
    var body: some View {
        NavigationStack{
            Button(action:{
                goToInfo = true
            }) {
                ZStack {
                    Color(.fontWhite)
                        .frame(maxWidth: 350, maxHeight: 425)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Image("Sample")
                        
                        Text(title)
                            .bold()
                            .font(.title)
                            .foregroundColor(.primary)
                        
                        Text("장소: \(place)")
                            .foregroundColor(.secondary)
                        
                        Text("대상: \(target)")
                            .foregroundColor(.secondary)
                        
                        Text("일시: \(date)")
                            .foregroundColor(.secondary)
                    }
                    .padding(20)
                }
            }
            .padding(.top, 16)
            .shadow(radius: 1)
            
            NavigationLink(destination: RallyInfo(), isActive: $goToInfo) {
                EmptyView()
            }
        }
    }
}
#Preview {
    RallyInfoCard()
}
