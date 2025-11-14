//
//  SubjectiveItem.swift
//  dodum-iOS
//
//  Created by maple on 11/12/25.
//

import SwiftUI

struct SubjectiveItem: View {
    @State var input : String
    var title : String
    var number : Int
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
                .frame(width: 343,height : 129)
                .shadow(color: .black.opacity(0.2), radius: 3, x : 5, y : 4)
                .overlay{
                    HStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 8,height: 120)
                            .foregroundStyle(.main)
                            .padding(.leading,0)
                        
                        VStack(alignment: .leading){
                            Text("\(number). \(title)")
                                .padding(.bottom,25)
                                .padding(.top,12)
                                .font(.medium(16))
                            TextField("",text:$input,prompt: Text("텍스트 입력"))
                                .frame(width: 223)
                                .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3)), alignment: .bottom)
                            Spacer()

                        }
                        .padding(.trailing,35)
                        .padding(.leading,20)
                        
                        Spacer()
                    }
                    
            }
        }
    }
}

#Preview {
    SubjectiveItem(input: "", title: "서답", number: 1)
}
