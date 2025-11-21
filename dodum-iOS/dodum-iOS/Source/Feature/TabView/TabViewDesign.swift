import SwiftUI

struct TabViewDesign: View {
    @Binding var SelectedItem : TabViewItem
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 64)
            .foregroundStyle(.primary)
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
                                            .fill(SelectedItem != item ? Color(.systemBackground) : .main)
                                            .frame(width: 30, height: 30)
                                    )
                                Text(item.Title)
                                    .font(.medium(8))
                                    .tint(.black)
                                    .padding(.bottom, 20)
                            }
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: 64)
                .padding(.bottom,0)
                
            }
                .padding(.horizontal,32)
        }
    }
}

