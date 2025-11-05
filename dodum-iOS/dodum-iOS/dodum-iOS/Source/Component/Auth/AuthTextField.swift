//
//  AuthTextField.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

struct AuthTextField: View {
    var text : String = ""
    @Binding var input :String
    @State var yaho : Bool = false
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(yaho ? .red : .gray)
            .frame(width:329 ,height:43 )
            .overlay{
                TextField(text,text: $input,prompt: Text(text).foregroundStyle(yaho ? .red : .gray))
                    .padding(.leading,12)
                    
            }
    }
}

