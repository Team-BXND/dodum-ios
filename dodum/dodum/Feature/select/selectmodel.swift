//
//  selectmodel.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

struct selectmodel: Identifiable{
    let id = UUID()
    var num : Int
    var topic : String
    var selected : tagitem = .common
    
}

