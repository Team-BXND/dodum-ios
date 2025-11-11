//
//  ContentView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct MainView: View {
    @State var ViewSelected : TabViewItem = .InfoShare
    @State var islogin : Bool = false
    var body: some View {
        if islogin == false{
            ZStack{
                Color(.background)
                VStack{
                    HStack{
                        Image(.logo)
                            .padding(.leading,13)
                            .padding(.bottom,10)
                        Spacer()
                        Button {
                            ViewSelected = .profile
                        } label: {
                            Image(ViewSelected != .profile ? .profile : .selectedProfile)
                                .padding(.trailing, 16)
                        }
                        .padding(.bottom,10)
                    }
                    .frame(height: 40)
                    VStack {
                        switch ViewSelected {
                        case .InfoShare:
                            ShareView()
                        case .Archive:
                            ArchiveView()
                        case .SelectMajor:
                            SelectView()
                        case .RallyInfo:
                            RallyInfoView()
                        case .etcInfo:
                            etcInfoView()
                        case .profile:
                            ProfileView(islogin: $islogin)
                        }
                        TabViewDesign(SelectedItem: $ViewSelected)
                    }
                }
            }
        }else{
            LoginView()
        }
    }
}




#Preview {
    MainView()
}
