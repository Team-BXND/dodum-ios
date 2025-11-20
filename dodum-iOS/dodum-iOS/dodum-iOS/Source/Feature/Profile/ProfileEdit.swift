import SwiftUI

struct ProfileEdit: View {
    @State private var goToChange = false
    @Environment(\.dismiss) private var dismiss
    @State var username: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var grade: String = ""
    @State var class_no: String = ""
    @State var student_no: String = ""
    @State private var SelectedClub: String = "동아리를 선택하세요."
    
    let clubs = ["BIND", "삼디", "두카미", "Louter", "CNS", "모디", "ALT", "Chatty"]

    var body: some View {
        NavigationStack {
            VStack {
                Button {
                } label: {
                    Image("PhotoEdit")
                        .padding(.top, 20)
                }
                Text("홍길동")
                    .font(.title)
                    .padding(.bottom, 8)
                
                Group {
                    Text("아이디")
                        .foregroundColor(.primary)
                        .padding(.leading, -160)
                    TextField("아이디", text: $username)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal,32)
                        .textInputAutocapitalization(.never)

                    Text("학번")
                        .foregroundColor(.primary)
                        .padding(.top, -4)
                        .padding(.leading, -160)
                    HStack {
                        TextField("학년", text: $grade)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                            .padding(.leading, 30)
                        TextField("반", text: $class_no)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                            .padding(.horizontal,)
                        TextField("번호", text: $student_no)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                            .padding(.trailing, 30)
                    }

                    Text("전화번호")
                        .foregroundColor(.primary)
                        .padding(.top, -4)
                        .padding(.leading, -160)
                    TextField("전화번호", text: $phone)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .padding(.horizontal,32)

                    Text("이메일 주소")
                        .foregroundColor(.primary)
                        .padding(.top, -4)
                        .padding(.leading, -160)
                    TextField("이메일 주소", text: $email)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal,32)

                    Text("동아리")
                        .foregroundColor(.primary)
                        .padding(.top, -4)
                        .padding(.leading, -160)

                    Menu {
                        ForEach(clubs, id: \.self) { club in
                            Button(action: {
                                SelectedClub = club
                            }) {
                                Text(club)
                                    .foregroundColor(.gray)
                            }
                        }
                    } label: {
                        HStack {
                            Text(SelectedClub)
                                .foregroundColor(.gray)
                                .padding(.leading, 12)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.secondary)
                                .padding(.trailing, 12)
                        }
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(UIColor.systemBackground))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                )
                        )
                        .padding(.horizontal, 32)
                    }
                }

                Spacer()

                HStack {
                       ZStack {
                        Color.main
                            .frame(maxWidth: 128, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                            goToChange = true
                        } label: {
                            Text("비밀번호 변경")
                                .foregroundColor(.white)
                        }
                    }
                       .padding(.leading, 30)

                    ZStack {
                        Color.main
                            .frame(maxWidth: 102, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                        } label: {
                            Text("수정완료")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()

                    ZStack {
                        Color.buttonGray
                            .frame(maxWidth: 72, maxHeight: 35)
                            .cornerRadius(8)
                        Button {
                            dismiss()
                        } label: {
                            Text("취소")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, 30)
                }
                .ignoresSafeArea(.keyboard)
                .padding(.bottom, 70)
                Spacer()
                
                NavigationLink(destination: ChangePswd(), isActive: $goToChange) {
                    EmptyView()
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    ProfileEdit()
}
