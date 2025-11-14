//
//  TabViewItem.swift
//  dodum-iOS
//
//  Created by maple on 10/15/25.
//

import SwiftUI

enum TabViewItem : CaseIterable{
    case InfoShare
    case Archive
    case SelectMajor
    case RallyInfo
    case etcInfo
    case profile
    
    static var Tabitems : [TabViewItem] {
        return [.InfoShare, .Archive, .SelectMajor, .RallyInfo, .etcInfo]
    }
    
    var Title : String{
        switch self{
        case .InfoShare:
            return "정보 공유"
        case .Archive:
            return "아카이브"
        case .SelectMajor:
            return "전공 선택"
        case .RallyInfo:
            return "대회 정보"
        case .etcInfo:
            return "기타 정보"
        case .profile:
            return ""
        }
    }
    
    var Image : String{
        switch self{
        case .InfoShare:
            return "InfoShare"
        case .Archive:
            return "Archive"
        case .SelectMajor:
            return "SelectMajor"
        case .RallyInfo:
            return "RallyInfo"
        case .etcInfo:
            return "etcInfo"
        case .profile:
            return "profile"
        }
    }
    
    var SelectedImage : String{
        switch self{
        case .InfoShare:
            return "SelectedInfoShare"
        case .Archive:
            return "SelectedArchive"
        case .SelectMajor:
            return "SelectedSelectMajor"
        case .RallyInfo:
            return "SelectedRallyInfo"
        case .etcInfo:
            return "SelectedetcInfo"
        case .profile:
            return "SelectedProfile"
        }
    }
}
