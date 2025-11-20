//
//  backbutton.swift
//  dodum-iOS
//
//  Created by maple on 10/29/25.
//

//import SwiftUI
//
//struct AddBackButtonViewModifier: ViewModifier {
//    @Environment(\.dismiss) private var dismiss
//    
//    let text: String
//    let systemImageName: String
//    let fontcolor: Color
//    
//    func body(content: Content) -> some View {
//        content
//            .navigationBarBackButtonHidden()
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        HStack {
//                            Image(systemName: systemImageName)
//                                .foregroundStyle(fontcolor)
//                            Text(text)
//                                .foregroundStyle(fontcolor)
//                                .font(.bold(16))
//                        }
//                    }
//                }
//            }
//    }
//}
//
//extension View {
//    func addBackButton(
//        text: String,
//        systemImageName: String,
//        fontcolor: Color = .white
//    ) -> some View {
//        self.modifier(AddBackButtonViewModifier(text: text, systemImageName: systemImageName, fontcolor: fontcolor))
//    }
//}

import SwiftUI

struct backbutton : View {
    @Environment(\.dismiss) private var dismiss
    var body : some  View{
        Button("뒤로가기"){
            dismiss()
        }
    }
}
