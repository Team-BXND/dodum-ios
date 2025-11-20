//
//  ShareModel.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI

struct ShareResponse : Decodable{
    var status: Int
    var data: [ShareModel]
}

struct ShareModel: Decodable, Identifiable{
    var id : Int
    var title: String
    var author: String
    var likes: Int
    var view: Int
    var comment: Int
    var Image: String
}

struct Shareresponse : Decodable {
    var status : Int
    var data : DetailModel
}

struct DetailModel : Decodable {
    var title:String
    var content:String
    var author:String
    var Date:Date
}
