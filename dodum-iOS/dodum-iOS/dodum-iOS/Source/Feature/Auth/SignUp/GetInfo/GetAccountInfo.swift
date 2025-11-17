import SwiftUI

struct GetAccountInfoView: View {
    @StateObject var sign : SignupViewModel
    @State var isfailed = false
    @State var inputpwcheck : String = ""
    @Binding var gonext : Int
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("회원가입 정보를 입력해주세요")
                        .font(.semibold(28))
                        .frame(width: 180)
                        .padding(.leading,32)
                    Spacer()
                }
                .padding(.top,68)
                .padding(.bottom,26)
                HStack{
                    Text("아이디")
                        .font(.regular(16))
                        .padding(.leading,32)
                    Spacer()
                }
                AuthTextField(text: "아이디를 입력하세요",input: $sign.Info.username, yaho: isfailed)
                HStack{
                    Text("비밀번호")
                        .font(.regular(16))
                        .padding(.leading,32)
                    Spacer()
                }
                SecretTextField(text: "비밀번호를 입력하세요",input: $sign.Info.password,yaho : isfailed)
                HStack{
                    Text("비밀번호 확인")
                        .font(.regular(16))
                        .padding(.leading,32)
                    Spacer()
                }
                SecretTextField(text: "비밀번호 확인",input: $inputpwcheck,yaho : isfailed)
                
                Button{
                    
                    gonext += 1
                }label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 330,height: 40)
                            .cornerRadius(8)
                            .foregroundStyle(.main)
                        Text("다음")
                            .font(.black(20))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.top,32)
                .disabled(sign.Info.username.isEmpty ||
                          sign.Info.password.isEmpty ||
                          sign.Info.password != inputpwcheck)
                .opacity(sign.Info.username.isEmpty ||
                         sign.Info.password.isEmpty ||
                         sign.Info.password != inputpwcheck ? 0.5 : 1)
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    @Previewable @State var yaho = 1
    GetAccountInfoView(sign: SignupViewModel(), gonext: $yaho)
}
