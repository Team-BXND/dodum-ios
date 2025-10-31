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
                
                Group {
                    Text("아이디")
                        .padding(.leading, -170)
                    Text("honggildong1234")
                        .font(.title2)
                        .padding(.leading, -170)
                    Text("학번")
                        .padding(.leading, -170)
                    Text("1400")
                        .font(.title2)
                        .padding(.leading, -170)
                    Text("전화번호")
                        .padding(.leading, -170)
                    Text("010-1234-5678")
                        .font(.title2)
                        .padding(.leading, -170)
                    Text("이메일 주소")
                        .padding(.leading, -170)
                    Text(verbatim: "honggildong1234@domain.com")
                        .font(.title2)
                        .padding(.leading, -30)
                    Text("동아리")
                        .padding(.leading, -170)
                    Text("바인드")
                        .font(.title2)
                        .padding(.leading, -170)
                }

                Spacer(minLength: 30)

                HStack {
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
