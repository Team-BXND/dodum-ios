import SwiftUI

struct RallyInfoView: View {
    @State private var goToAdd = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    RallyInfoCard(
                        title: "대회명1",
                        place: "대구광역시 창리로93길 11",
                        target: "전교생",
                        date: "2월 29일 ~ 2월 30일"
                    )
                    RallyInfoCard(
                        title: "대회명2",
                        place: "대구광역시 창리로93길 11",
                        target: "전교생",
                        date: "2월 29일 ~ 2월 30일"
                    )
                    RallyInfoCard(
                        title: "대회명3",
                        place: "대구광역시 창리로93길 11",
                        target: "전교생",
                        date: "2월 29일 ~ 2월 30일"
                    )
                }
                
                ZStack {
                    Color.main
                        .frame(width: 52, height: 52)
                        .cornerRadius(50)
                    
                    Button("+") {
                        goToAdd = true
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 32))
                    .bold()
                }
                .shadow(radius: 5)
                .padding(.trailing, 16)
                .padding(.bottom, 16)
                
                NavigationLink(destination: RallyInfoAdd(), isActive: $goToAdd) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    RallyInfoView()
}
