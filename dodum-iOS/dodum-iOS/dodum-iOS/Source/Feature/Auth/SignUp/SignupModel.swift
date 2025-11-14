//
//  SignupModel.swift
//  dodum-iOS
//
//  Created by maple on 10/27/25.
//

import SwiftUI

struct SignupModel : Codable{
    var username : String = ""
    var password : String = ""
    var grade : Int = 1
    var class_no : Int = 1
    var student_no : Int = 1
    var phone : String = ""
    var email : String = ""
    var major : String?
    var history : String?
    var club : club?
}

enum club : String, CaseIterable,Codable{
    case BIND, 삼디, 두카미, Louter, CNS, 모디, ALT, Chatty, None
}
