//
//  TabVeiw.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

struct TabVeiwDesign: View {
    @Binding var selected : TabVeiwItem
    var body: some View {
        Rectangle()
            .frame(width: 344,height: 50)
            .cornerRadius(30)
            .background(.white)
            .shadow(radius: 2)
            .foregroundStyle(.white)
            .overlay {
                VStack{
                    HStack{
                        ForEach(TabVeiwItem.allCases,id: \.self){item in
                            Button{
                                selected = item
                            }label: {
                                VStack{
                                    Image(item.image)
                                        .background(selected != item ? .white : .green)
                                    Text(item.text)
                                }
                            }
                        }
                    }
                    .frame(width: .infinity)
                    
                }
            }
        
    }
}


