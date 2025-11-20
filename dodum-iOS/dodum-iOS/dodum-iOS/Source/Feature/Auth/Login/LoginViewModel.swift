//
//  LoginViewModel.swift
//  dodum-iOS
//
//  Created by maple on 10/27/25.
//

import SwiftUI

class LoginViewModel : ObservableObject{
    @Published var arr : LoginModel = LoginModel(id: "", pw: "")
    @Published var showalert : Bool = false
    @Published var errormessage : String = ""
    
    
    
    func login() async{
        do{
            let result = try await NetworkRunner.shared.request("auth/signin", method: .post,parameter: arr,  response: LoginResponse.self)
            UserDefaults.standard.setValue(result.data?.accessToken, forKey: "access")
            UserDefaults.standard.setValue(result.data?.refreshToken, forKey: "refresh")
            
        } catch {
            errormessage = error.localizedDescription
            showalert = true
        }
    }
    
}
