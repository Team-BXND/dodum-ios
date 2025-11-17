//
//  LoginView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var lgin = LoginViewModel()
    @State var isfailed = false
    @State var inputid : String = ""
    @State var inputpw : String = ""
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("로그인 정보를 입력해주세요")
                        .font(.bold(28))
                        .frame(width: 160)
                        .padding(.leading,32)
                    Spacer()
                }
                .padding(.top,68)
                .padding(.bottom,26)
                
                HStack{
                    Text("아이디")
                        .padding(.leading,32)
                        .font(.regular(16))
                    Spacer()
                }
                AuthTextField(text: "아이디를 입력하세요",input: $lgin.arr.id, yaho: isfailed)
                    .padding(.bottom,12)
                HStack{
                    Text("비밀번호")
                        .padding(.leading,32)
                    Spacer()
                }
                AuthTextField(text: "비밀번호를 입력하세요",input: $lgin.arr.pw,yaho : isfailed)
                HStack{
                    Text("존재하지 않는 계정이거나 비밀번호가 존재하지 않습니다.")
                        .foregroundStyle(isfailed ? .red : .white)
                        .font(.regular(12))
                        .padding(.leading,40)
                    Spacer()
                }
                HStack{
                    Button{
                        
                    }label: {
                        Text("비밀번호를 잊으셨나요?")
                            .underline()
                            .foregroundStyle(.gray)
                            .font(.regular(12))
                            .padding(.leading,10)
                    }
                    Spacer()
                    NavigationLink{
                        SignupView()
                    }label: {
                        Text("회원가입")
                            .underline()
                            .foregroundStyle(.gray)
                            .font(.regular(12))
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .padding(.leading,32)
                .padding(.trailing,32)
                .padding(.bottom,32)
                Button{
                    Task{
                        await lgin.login()
                    }
                }label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 330,height: 40)
                            .cornerRadius(8)
                            .foregroundStyle(.main)
                        Text("로그인")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
