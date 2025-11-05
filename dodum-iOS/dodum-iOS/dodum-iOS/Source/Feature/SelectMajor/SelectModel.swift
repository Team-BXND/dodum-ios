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
    let number : Int
    var selected : SelectType
    var input : String = ""
}

