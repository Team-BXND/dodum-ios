//
//  selectitem.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

struct selectitem: View {
    @State var selected : tagitem = .common
    var num : Int = 1
    var topic : String = "지금 기분"
    var body: some View {
        Rectangle()
            .frame(width: 343,height: 120)
            .cornerRadius(30)
            .foregroundStyle(.white)
            .shadow(radius: 3)
            .overlay {
                VStack{
                    Text("\(selected)")
                    HStack{
                        Text("\(num)")
                            .padding(.leading,40)
                        Text(topic)
                        Spacer()
                    }
                    Spacer()
                HStack{
                    ForEach(tagitem.allCases,id: \.self){item in
                        Button{
                            print(item)
                            selected = item
                        }label: {
                            Text(item.text)
                                .background(selected == item ? .blue : .red)
                        }
                        
                    }
                }
                .padding(.bottom,55)
            }
        }
    }
}

enum tagitem : CaseIterable{
    case verygood
    case good
    case common
    case bad
    case verybad
    
    var text : String{
        switch self{
            
        case .verygood:
            return "베굿"
        case .good:
            return "굿"
        case .common:
            return "음"
        case .bad:
            return "읡"
        case .verybad:
            return "베읡"
        }
    }
}




#Preview {
    selectitem()
}
