import SwiftUI

struct RallyInfo: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("대회명")
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
                Text("장소: 대구광역시 창리로93길 11")
                Text("대상: 전학생")
                Text("일시: 2월 29일 ~ 2월 30일")
                Text("자세한 대회내용")
                    .font(.title3)
                    .padding(.top, 23)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 30)
            .padding(.leading, 41)
        }
    }
}

#Preview {
    RallyInfo()
}
