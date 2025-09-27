//
//  ContentView.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

struct MainView: View {
    @State var vie : TabVeiwItem = .archive
    
    var body: some View {
        ZStack{
            VStack {
                Text("\(vie)")
                switch vie{
                case .archive:
                    selectview()
                case .selectMajor:
                    firstview()
                case .share:
                    secondeview()
                case .대회_info:
                    firstview()
                case .기타_info:
                    thirdview()
                }
                
            }
            VStack{
                Spacer()
                TabVeiwDesign(selected: $vie)
                    .padding(.bottom,45)
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
