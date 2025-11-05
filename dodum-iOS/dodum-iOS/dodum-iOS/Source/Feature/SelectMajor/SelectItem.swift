//
//  SelectItem.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

struct SelectMCItem: View {
    @Binding var selected : SelectType
    var number : Int
    var title : String
    
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
                .frame(width: 343,height : 129)
                .shadow(color: .black.opacity(0.2), radius: 3, x : 5, y : 4)
                .overlay{
                    HStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 8,height: 120)
                            .foregroundStyle(.main)
                        VStack{
                            HStack{
                                Text("\(number). \(title)")
                                    
                                Spacer()
                            }
                            HStack(spacing: 40){
                                ForEach(SelectType.allCases, id: \.self){item in
                                    Button{
                                        selected = item
                                    }label: {
                                        Circle()
                                            .fill(selected == item ? item.color : Color.clear)
                                            .stroke(item.color)
                                            .frame(width: CGFloat(item.size), height :CGFloat(item.size))
                                            .overlay {
                                                Image(systemName: "checkmark")
                                                    .frame(width: 12, height: 16)
                                                    .foregroundStyle(.white)
                                            }
                                            
                                        
                                            
                                    }
                                }
                                
                                
                            }
                            .padding(.trailing,35)
                            HStack{
                                Text("동의함")
                                    .padding(0)
                                    .font(.regular(12))
                                    .foregroundStyle(.selectItemleft)
                                Spacer()
                                Text("동의하지 않음")
                                    .padding(.trailing,32)
                                    .font(.regular(12))
                                    .foregroundStyle(.selectitemright)
                            }
                            .frame(width: .infinity)
                            .padding(.top,4)
                            .padding(.bottom,12)
                        }
                        .padding(.leading,20)
                        Spacer()
                    }
                    
                }
            }
        }
    }


//struct SelectSJItem : View {
//    var number : Int
//    var title : String
//    @State var input : String
//    var body: some View {
//        HStack{
//            RoundedRectangle(cornerRadius: 12)
//                .foregroundStyle(.white)
//                .frame(width: 343,height : 129)
//                .shadow(color: .black.opacity(0.2), radius: 3,x : -3, y: -4)
//                .shadow(color: .black.opacity(0.2), radius: 3, x : 3, y : 4)
//                .overlay{
//                    HStack{
//                        RoundedRectangle(cornerRadius: 12)
//                            .frame(width: 8,height: 120)
//                            .foregroundStyle(.main)
//                        VStack{
//                            Text("\(number). \(title)")
//                            HStack{
//                                TextField("입력하시오",text: $input)
//                            }
//                            .frame(width: .infinity)
//                        }
//                    }
//                }
//            }
//        }
//}
    


enum SelectType : CaseIterable{
    case verygood, good, common, bad, verybad
    
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

