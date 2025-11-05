//
//  SelectVeiwModel.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

class SelectVeiwModel : ObservableObject{
    @Published var question : [SelectModel] = [
        SelectModel(title: "희망하는 전공 분야는?", number: 1,selected: 1),
        SelectModel(title: "하고싶은 것은?", number: 2,selected: 1)
    ]
}
