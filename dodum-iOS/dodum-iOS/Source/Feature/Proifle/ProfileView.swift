import SwiftUI

struct ProfileView: View {
    @State private var goToEdit = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("Photo")
                    .padding(.top, 20)
                Text("홍길동")
                    .font(.title)
                    .padding(.bottom, 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("아이디")
                    Text("honggildong1234")
                        .font(.title2)
                    Text("학번")
                    Text("1400")
                        .font(.title2)
                    Text("전화번호")
                    Text("010-1234-5678")
                        .font(.title2)
                    Text("이메일 주소")
                    Text(verbatim: "honggildong1234@domain.com")
                        .font(.title2)
                    Text("동아리")
                    Text("바인드")
                        .font(.title2)
                }
                .padding(14)
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer(minLength: 30)

                HStack(spacing: 25) {
                    ZStack {
                        Color.main
                            .frame(maxWidth: 124, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                            goToEdit = true
                        } label: {
                            Text("내 정보 수정")
                                .foregroundColor(.white)
                        }
                    }

                    ZStack {
                        Color.red
                            .frame(maxWidth: 103, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                        } label: {
                            Text("로그아웃")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.top, -150)
                
                NavigationLink(destination: ProfileEdit(), isActive: $goToEdit) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
