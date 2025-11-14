//
//  SignupResponse.swift
//  dodum-iOS
//
//  Created by maple on 11/7/25.
//

import SwiftUI

struct SignupResponse: Decodable {
    var status: Int
    var data : String
}

struct EmailSendResponse<dataType : Decodable> : Decodable {
    let status : Int
    let data : dataType?
    let error : EmailsendError?
    
}

struct EmailsendError : Decodable{
    let code : String
    let message : String
    let timestamp : Date
}

struct EamilCheck : Decodable{
    let status : Int
    let data : Bool?
    let error : EmailcheckError?
}

struct EmailcheckError : Decodable {
    let code : String
    let message : String
    let timestamp : String
}

enum NetworkError: Error {
    case serverError(String)
    case decodingError
    case unknown(Error)
}

struct APIResponse<DataType : Decodable> : Decodable{
    let status : Int
    let data : DataType?
    let error : APIError
}

struct APIError : Decodable {
    let code : String
    let message : String
    let timestamp : String
}
