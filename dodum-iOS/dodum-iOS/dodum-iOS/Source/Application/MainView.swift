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
            VStack{
                HStack{
                    Image(.logo)
                        .padding(.leading,13)
                        
                    Spacer()
                    Button("testlogin"){islogin = true}
                    Button {
                        ViewSelected = .profile
                    } label: {
                        Image(ViewSelected != .profile ? .profile : .selectedProfile)
                            .padding(.trailing, 16)
                    }
                    
                }
                .frame(height: 40)
                .padding(.top,53)
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
                        ProfileView()
                    }
                    TabViewDesign(SelectedItem: $ViewSelected)
                }
            }
            .ignoresSafeArea()
        }else{
            LoginView()
        }
            
    }
        
}



#Preview {
    MainView()
}
