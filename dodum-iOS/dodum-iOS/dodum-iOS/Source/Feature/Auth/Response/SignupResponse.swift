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

struct APIResponse<DataType : Decodable> : Decodable{
    let status : Int
    let data : DataType?
    let error : APIError?
}

struct APIError : Decodable {
    let code : String
    let message : String
    let timestamp : String
}
