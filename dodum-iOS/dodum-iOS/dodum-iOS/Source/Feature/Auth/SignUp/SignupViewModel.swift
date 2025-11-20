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
    @Published var ispost = false
    
    
    @MainActor
    func emailsend() async {
        do {
            let result = try await NetworkRunner.shared.request(
                "auth/email/send",
                method: .post,
                parameter: ["email" : Info.email],
                response: APIResponse<String>.self
            )
            alertMessage = result.data ?? "디코딩 안됨ㅇㅇ"
            showalert = true
        } catch {
            alertMessage = error.localizedDescription
            showalert = true
            print(error)
        }
    }
    
    @MainActor
    func emailrcheck(authnumber : String) async{
        do {
            let result = try await NetworkRunner.shared.request(
                "auth/email/check",
                method: .post,
                parameter: ["email":Info.email,"authnum":authnumber],
                response: APIResponse<Bool>.self
            )
            ispost = result.data!
            
        } catch {
            alertMessage = error.localizedDescription
            showalert  = true
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


