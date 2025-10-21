//
//  TabViewDesign.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI

struct TabViewDesign: View {
    @Binding var SelectedItem : TabViewItem
    var body: some View {
        Rectangle()
            .frame(width: 344, height: 50)
            .cornerRadius(10)
            .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.2), radius: 3,x : -3, y: -4)
            .shadow(color: .black.opacity(0.2), radius: 3, x : 3, y : 4)
            .overlay{
                HStack{
                    ForEach(TabViewItem.Tabitems, id: \.self){item in
                            Button{
                                SelectedItem = item
                            }label:{
                                VStack{
                                    Image(SelectedItem != item ? item.Image : item.SelectedImage)
                                        .frame(width: 34, height: 34)
                                        .background(
                                            RoundedRectangle(cornerRadius: 9)
                                                .fill(SelectedItem != item ? .white : .main)
                                        )
                                    Text(item.Title)
                                        .font(.system(size: 8))
                                        .tint(.black)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
            }
    }
}

