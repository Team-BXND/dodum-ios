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
                ForEach($SelectVM.select_questions){$item in
                    Color.white
                    SelectItem(selected: $item.selected, number: item.num, title: item.title)
                }
                ForEach(1...2,id: \.self){item in
                    Color.white
                    SubjectiveItem(input: "", title: "임시 텍스트", number: 1)
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
        .onAppear{
            SelectVM.GenerateSelect()
        }
    }
}

#Preview {
    SelectView()
}
