import SwiftUI
struct GetVerificate: View {
    @StateObject var SignupVM : SignupViewModel
    @State var isfailed = false
    @State var inputemail : String = ""
    @State var inputauthnum : String = ""
    @State var inputpwcheck : String = ""
    @State var ispost : Bool = false
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
                    Text("이메일")
                        .font(.regular(16))
                        .padding(.leading,32)
                    Spacer()
                }
                HStack{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray)
                        .frame(width:238 ,height:43 )
                        .overlay{
                            TextField("",text: $SignupVM.Info.email,prompt: Text("이메일을 입력하세요").foregroundStyle(.gray))
                                .padding(.leading,12)
                        }
                    Rectangle()
                        .frame(width: 87,height: 40)
                        .cornerRadius(8)
                        .foregroundStyle(.main)
                        .overlay{
                            Button{
                                Task{
                                    await SignupVM.emailsend()
                                }
                            }label: {
                                Text("인증번호 전송")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.white)
                            }
                        }
                }
                
                HStack{
                    Text("인증번호")
                        .font(.regular(16))
                        .padding(.leading,32)
                    Spacer()
                }
                AuthTextField(text: "인증번호를 입력하세요",input: $inputauthnum,yaho : isfailed)
                    .keyboardType(.numberPad)
                Button{
                    Task{
                        await SignupVM.emailrcheck(authnumber: inputauthnum)
                    }
                    if ispost{
                        Task{
                            await SignupVM.Signuppost()
                        }
                    }else {
                        
                    }
                }label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 330,height: 40)
                            .cornerRadius(8)
                            .foregroundStyle(.main)
                        Text("회원가입")
                            .font(.black(20))
                            .foregroundStyle(.white)
                    }
                }
                .alert("알림",isPresented: $SignupVM.showalert){
                    Button("알림",role: .cancel){}
                }message: {
                    Text(SignupVM.alertMessage)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}



