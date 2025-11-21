import SwiftUI

struct RallyInfo: View {
    var title: String = "제목"
    var place: String = "장소"
    var target: String = "대상"
    var date: String = "일시"
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .bold()
                    .font(.title)
                    .padding(.trailing, 180)
                Button {
                } label: {
                    Image("alarmOff")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            Image("Sample")
            VStack(alignment: .leading) {
                Text("장소: \(place)")
                Text("대상: \(target)")
                Text("일시: \(date)")
                Text("자세한 대회내용")
                    .font(.title3)
                    .padding(.top, 23)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.leading, 41)
        }
        Spacer()
    }
}

#Preview {
    RallyInfo()
}
