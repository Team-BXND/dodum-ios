//
//  selectviewmodel.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

class selectviewmodel : ObservableObject{
    @Published var arr : [selectmodel] = [
        selectmodel(num : 1, topic: "야호"),
        selectmodel(num: 2, topic: "히히"),
        selectmodel(num: 3, topic: "히히"),
        selectmodel(num: 4, topic: "히히"),
        selectmodel(num: 5, topic: "히히"),
        selectmodel(num: 6, topic: "히히"),
        selectmodel(num: 7, topic: "히히"),
        selectmodel(num: 8, topic: "히히"),
        selectmodel(num: 9, topic: "히히")
    ]
}
