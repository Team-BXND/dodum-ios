//
//  dodum_iOSApp.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

@main
struct dodum_iOSApp: App {
    @State var islogin = false
    var body: some Scene {
        WindowGroup {
            if !islogin {
                MainView(islogin: $islogin)
            }else{
                LoginView()
            }
        }
    }
}
