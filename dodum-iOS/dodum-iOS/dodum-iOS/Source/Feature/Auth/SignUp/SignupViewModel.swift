//
//  SignupViewModel.swift
//  dodum-iOS
//
//  Created by maple on 10/27/25.
//
import SwiftUI

class SignupViewModel : ObservableObject{
    @Published var Info : SignupModel = SignupModel(username: "", password: "", grade: 1, class_no: 1,
                                                student_no: 1, phone: "", email: "")
    @Published var alertMessage : String = ""
    @Published var showalert = false
    
    func emailsend() async {
        do {
            let result = try await NetworkRunner.shared.request(
                "auth/email/send",
                method: .post,
                parameter: ["email" : Info.email],
                response: APIResponse<String>.self
            )
            if let data = result.data{
                print("성공",data)
            }
        } catch {
            
        }
    }
    
    func emailrcheck(email : String, authnumber : String) async{
        do {
            let result = try await NetworkRunner.shared.request(
                "auth/email/check",
                method: .post,
                parameter: ["email":email,"authnum":authnumber],
                response: APIResponse<Bool>.self
            )
            
            
        } catch {
            
        }
    }
    
    @MainActor
    func Signuppost() async {
        do{
            let result = try await NetworkRunner.shared.request(
                "auth/signup",
                method: .post,
                parameter: Info,
                response: SignupResponse.self
            )
            alertMessage = result.data
            showalert = true
            print("됨",result.data)
        } catch{
            alertMessage = error.localizedDescription
            showalert = true
            print("안됨",error.localizedDescription)
            
        }
    }
}


