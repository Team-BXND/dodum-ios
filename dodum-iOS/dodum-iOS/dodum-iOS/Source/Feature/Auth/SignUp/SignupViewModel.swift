//
//  SignupViewModel.swift
//  dodum-iOS
//
//  Created by maple on 10/27/25.
//
import SwiftUI
class SignupViewModel : ObservableObject{
    @Published var Signup : SignupModel = SignupModel(username: "", password: "", grade: 1, class_no: 1, student_no: 1, phone: "", email: "")
    
    func emailsend(){
        
    }
    
    func authnumbercheck(){
        
    }
}
