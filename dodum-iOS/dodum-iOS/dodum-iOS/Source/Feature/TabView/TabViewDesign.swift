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
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundStyle(.white)
            .overlay{
                HStack{
                    ForEach(TabViewItem.Tabitems, id: \.self){item in
                            Button{
                                SelectedItem = item
                            }label:{
                                VStack{
                                    Image(SelectedItem != item ? item.Image : item.SelectedImage)
                                        .resizable()                     
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .background(
                                            RoundedRectangle(cornerRadius: 9)
                                                .fill(SelectedItem != item ? .white : .main)
                                                .frame(width: 30, height: 30)
                                        )
                                    Text(item.Title)
                                        .font(.medium(8))
                                        .tint(.black)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
            }
    }
}

