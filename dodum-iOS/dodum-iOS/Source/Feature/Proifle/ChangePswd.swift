import SwiftUI

struct ChangePswd: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var newpassword: String = ""
    @State private var passwordCheck: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Image("Photo")
                    .padding(.top, 20)
                Text("홍길동")
                    .font(.title)
                    .padding(.bottom, 8)
                
                Group {
                    Text("기존 비밀번호")
                        .padding(.leading, -160)
                    SecureField("기존 비밀번호", text: $password)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal, 32)
                        .textInputAutocapitalization(.never)
                    
                    Text("새 비밀번호")
                        .padding(.leading, -160)
                    SecureField("새 비밀번호", text: $newpassword)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal, 32)
                        .textInputAutocapitalization(.never)
                    Text("새 비밀번호 확인")
                        .padding(.leading, -160)
                    SecureField("새 비밀번호 확인", text: $passwordCheck)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal, 32)
                        .textInputAutocapitalization(.never)
                }
                Spacer()
                
                HStack(spacing: 24) {
                    ZStack {
                        Color.main
                            .frame(maxWidth: 124, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                        } label: {
                            Text("비밀번호 변경")
                                .foregroundColor(.white)
                        }
                    }

                    ZStack {
                        Color.gray
                            .frame(maxWidth: 72, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                            dismiss()
                        } label: {
                            Text("취소")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.top, -150)
                .ignoresSafeArea(.keyboard)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ChangePswd()
}
