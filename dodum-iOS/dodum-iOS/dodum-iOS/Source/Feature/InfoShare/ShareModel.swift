//
//  ShareModel.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI
import Foundation

struct ShareModel: Identifiable {
    let id = UUID()
    var category: String?
    var title: String
    var subtitle: String
    var content: String
    var imageName: String
    var image: UIImage?
    var authorRole: Int
    var isAnonymous: Bool
    var date: Date = Date()
}
