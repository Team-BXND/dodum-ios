//import SwiftUI
//
//struct Archive: View {
//    var title: String = "제목"
//    var place: String = "장소"
//    var target: String = "대상"
//    var date: String = "일시"
//    
//    var body: some View {
//        
//        VStack(spacing: 8) {
//            Text(title)
//                .bold()
//                .font(.title)
//                .multilineTextAlignment(.leading)
//            Image("Sample")
//            VStack(alignment: .leading) {
//                Text("장소: \(place)")
//                Text("대상: \(target)")
//                Text("일시: \(date)")
//                Text("자세한 대회내용")
//                    .font(.title3)
//                    .padding(.top, 23)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.top, 30)
//            .padding(.leading, 41)
//        }
//        Spacer()
//    }
//}
//
//#Preview {
//    Archive()
//}

import SwiftUI

struct Archive: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("도담도담")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("스마트 스쿨을 학교의 새로운 패러다임을 만듭니다.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text("YYYY.MM.DD · TEAM - NAME")
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.6))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 60)
                .padding(.bottom, 40)
                
                Divider()
                    .background(Color.gray.opacity(0.2))
                
                Text("도담도담은 외출/외박 신청, 심야 자습 신청, 급식 확인, 기숙사 아침 기상송 확인, 학교와 기숙사 상벌점 조회, 퇴사 버스 신청, 학교 일정 조회 기능을 제공합니다.")
                    .padding(.horizontal, 32)
                    .padding(.vertical, 32)
                
                Image("Sample")
                    .resizable()
                    .padding(.horizontal, 32)
            }
        }
    }
}

#Preview {
    Archive()
}
