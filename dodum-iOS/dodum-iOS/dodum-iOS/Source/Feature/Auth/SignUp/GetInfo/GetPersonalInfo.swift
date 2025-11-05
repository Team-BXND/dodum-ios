//
//  GetPersonalInfo.swift
//  dodum-iOS
//
//  Created by maple on 10/29/25.
//

import SwiftUI

struct GetPersonalInfoView: View {
    @StateObject var signupVM : SignupViewModel
    @State var isfailed = false
    @State var inputgrade : Int? = nil
    @State var inputclass : Int? = nil
    @State var inputnum : String = ""
    @State var clubselect : club = .None
    var number : Int{
        Int(inputnum) ?? 0
    }
    @State var inputphone : String = ""
    @State var gradearr = [1,2,3]
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
                    Text("학번")
                        .padding(.leading,32)
                    Spacer()
                }
                HStack{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray)
                        .frame(width : 104 ,height:43 )
                        .overlay(alignment: .leading){
                            Menu{
                                ForEach(1...3,id: \.self){item in
                                    Button("\(item)학년"){
                                        inputgrade = item
                                    }
                                }
                            }label: {
                                Text(inputgrade == nil ? "학년" : "\(inputgrade!)학년")
                                    .foregroundStyle(inputgrade == nil ? .gray : .black)
                            }
                            .padding(.leading,10)
                        }
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray)
                        .frame(width:104 ,height:43 )
                        .overlay(alignment: .leading){
                            Menu{
                                ForEach(1...4,id: \.self){item in
                                    Button("\(item)반"){
                                        inputclass = item
                                    }
                                }
                            }label: {
                                Text(inputclass == nil ? "반" : "\(inputclass!)반")
                                    .foregroundStyle(inputclass == nil ? .gray : .black)
                            }
                            .padding(.leading,10)
                            
                        }
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray)
                        .frame(width:104 ,height:43 )
                        .overlay{
                            TextField("번호",text: $inputnum)
                                .padding(.leading,12)
                        }
                }
                HStack{
                    Text("전화번호")
                        .padding(.leading,32)
                    Spacer()
                }
                AuthTextField(text: "전화번호를 입력하세요",input: $inputphone,yaho : isfailed)
                HStack{
                    Text("동아리")
                        .padding(.leading,32)
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray)
                    .frame(width : 329 ,height:43 )
                    .overlay(alignment: .leading){
                        Picker("동아리",selection: $clubselect){
                            ForEach(club.allCases,id:\.self){item in
                                Text("\(item)")
                                    
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(clubselect == .None ? .gray : .black)
                        }
                Button{
                    if (inputclass != nil && inputgrade != nil && inputphone != ""){
                        signupVM.Signup.class_no = inputclass!
                        signupVM.Signup.grade = inputgrade!
                        signupVM.Signup.student_no = number
                        signupVM.Signup.phone = inputphone
                        signupVM.Signup.club = clubselect
                        gonext += 1
                    }
                }label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 330,height: 40)
                            .cornerRadius(8)
                            .foregroundStyle(.main)
                        Text("다음")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                    }
                }
                .padding(.leading,10)
                .padding(.top,32)
                .disabled(inputclass == nil || inputgrade == nil || inputphone == "")
                .opacity(inputclass == nil || inputgrade == nil || inputphone == "" ? 0.5 : 1)
                Spacer()
            }
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}
