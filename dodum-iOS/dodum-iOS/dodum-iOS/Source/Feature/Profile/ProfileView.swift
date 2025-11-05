//
//  ProfileView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var islogin : Bool
    var body: some View {
        NavigationStack{
            Text("프로필")
            Button("로그인"){
                islogin.toggle()
            }
        }
    }
}

