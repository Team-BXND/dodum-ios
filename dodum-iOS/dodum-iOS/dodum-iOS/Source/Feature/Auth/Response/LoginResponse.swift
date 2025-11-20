//
//  LoginResponse.swift
//  dodum-iOS
//
//  Created by maple on 11/13/25.
//

struct LoginResponse : Decodable {
    var status : Int
    var data : Token?
    var error : loginerror?
}

struct Token : Decodable{
    let accessToken : String
    let refreshToken : String
}

struct loginerror : Decodable {
    let code : String
    let message : String
    let timestamp : Int
    
}
