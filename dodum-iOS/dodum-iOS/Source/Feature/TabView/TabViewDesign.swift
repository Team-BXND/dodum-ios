import SwiftUI

struct TabViewDesign: View {
    @Binding var SelectedItem: TabViewItem
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Rectangle()
            .frame(width: 344, height: 50)
            .cornerRadius(10)
            .foregroundStyle(colorScheme == .dark ? Color(white: 0.15) : .white)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.4 : 0.2), radius: 3, x: -3, y: -4)
            .shadow(color: .black.opacity(colorScheme == .dark ? 0.4 : 0.2), radius: 3, x: 3, y: 4)
            .overlay {
                HStack {
                    ForEach(TabViewItem.Tabitems, id: \.self) { item in
                        Button {
                            SelectedItem = item
                        } label: {
                            VStack {
                                Image(SelectedItem != item ? item.Image : item.SelectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .background(
                                        RoundedRectangle(cornerRadius: 9)
                                            .fill(SelectedItem != item ?
                                                  (colorScheme == .dark ? Color(white: 0.15) : .white) :
                                                  .main)
                                            .frame(width: 30, height: 30)
                                    )
                                Text(item.Title)
                                    .font(.system(size: 8))
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
    }
}
