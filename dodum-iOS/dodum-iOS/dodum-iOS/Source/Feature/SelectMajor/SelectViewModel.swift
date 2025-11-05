//
//  SelectVeiwModel.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

class SelectViewModel : ObservableObject{
    @Published var question : [SelectModel] = [
        SelectModel(title: "첫번째 문항", number: 1,selected: .common),
        SelectModel(title: "두번째 문항", number: 2,selected: .common)
    ]
}
