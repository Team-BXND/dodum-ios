//
//  SelectView.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct SelectView: View {
    @StateObject var SelectVM = SelectViewModel()
    var body: some View {
        VStack{
        Image(.mbti)
            ScrollView(showsIndicators: false) {
                ForEach($SelectVM.question){$item in
                    Color.white
                    SelectMCItem(selected: $item.selected, number: item.number, title: item.title)
                }
                Button{
                    
                }label: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.main)
                        .frame(width:343 ,height:43 )
                        .overlay{
                            Text("제출하기")
                                .foregroundStyle(.main)
                        }
                }
                .padding(.top,66)
            }
        }
    }
}

#Preview {
    SelectView()
}
