//
//  ContentView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct MainView: View {
    @State var ViewSelected : TabViewItem = .InfoShare
    var body: some View {
        VStack{
            HStack{
                Image(.logo)
                    .padding(.leading,13)
                Spacer()
                Button{
                    ViewSelected = .profile
                }label: {
                    Image(ViewSelected != .profile ? .profile : .selectedProfile)
                        .padding(.trailing, 16)
                }
            }
            .frame(height: 125)
            ZStack{
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
                VStack{
                    Spacer()
                    TabViewDesign(SelectedItem: $ViewSelected)
                        .padding(.bottom,45)
                }
            }
        }
    }
}


#Preview {
    MainView()
}
