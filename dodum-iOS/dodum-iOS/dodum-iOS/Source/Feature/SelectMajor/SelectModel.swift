//
//  SelectModel.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

struct SelectModel: Identifiable{
    let id = UUID()
    let title : String
    let num : Int
    var selected : SelectType = .common
    var input : String = ""
}

struct SubjectiveModel : Identifiable{
    let id = UUID()
    let num : Int
    let title : String
    var input : String
}
