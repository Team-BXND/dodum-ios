//
//  TabVeiwItem.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

enum TabVeiwItem:CaseIterable {
    case archive
    case selectMajor
    case share
    case 대회_info
    case 기타_info
    
    var text : String{
        switch self{
            
        case .archive:
            return "아카이브"
        case .selectMajor:
            return "전공선택"
        case .share:
            return "정보공유"
        case .대회_info:
            return "대회정보"
        case .기타_info:
            return "기타정보"
        }
    }
    
    var image : String{
        switch self{
            
        case .archive:
            return "box"
        case .selectMajor:
            return "search"
        case .share:
            return "image4"
        case .대회_info:
            return "daily"
        case .기타_info:
            return "bookmark"
        }
    }
}
