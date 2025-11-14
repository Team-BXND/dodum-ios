//
//  SelectItem.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

struct SelectItem: View {
    @Binding var selected : SelectType
    var number : Int
    var title : String
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
                        Spacer()
                        VStack(alignment: .leading){
                            Text("\(number). \(title)")
                                .padding(.bottom, 13)
                                .font(.medium(16))
                            HStack(spacing: 40){
                                ForEach(SelectType.allCases, id: \.self) { item in
                                    Button {
                                        selected = item
                                    } label: {
                                        Circle()
                                            .fill(selected == item ? item.color : Color.clear)
                                            .stroke(item.color)
                                            .frame(width: CGFloat(item.size), height: CGFloat(item.size))
                                            .overlay {
                                                Image(systemName: "checkmark")
                                                    .frame(width: 12, height: 16)
                                                    .foregroundStyle(.white)
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.trailing,35)
                        .padding(.leading,20)
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var selected : SelectType = .common
    SelectItem(selected: $selected, number: 1, title: "서버 통신을 좋아하뇽? ㅇㅇㅇㅇㅇㅇㅇㅇㅇ")
}



enum SelectType : Int, CaseIterable{
    case verygood = 1
    case good = 2
    case common = 3
    case bad = 4
    case verybad = 5
    
    var status : Int{
        switch self{
        case .verygood:
            return 1
        case .good:
            return 2
        case .common:
            return 3
        case .bad:
            return 4
        case .verybad:
            return 5
        }
    }
    var color : Color{
        switch self{
        case .verygood,.good:
            return .selectItemleft
        case .verybad,.bad:
            return .selectitemright
        case .common:
            return .gray
        }
    }
    var size : Int{
        switch self{
        case .verygood, .verybad:
            return 27
        case .good, .bad:
            return 24
        case .common:
            return 21
            
        }
    }
    
}
