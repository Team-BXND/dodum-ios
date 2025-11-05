//
//  SecretField.swift
//  dodum-iOS
//
//  Created by maple on 11/3/25.
//

import SwiftUI

struct SecretTextField: View {
    var text : String = ""
    @Binding var input :String
    @State var yaho : Bool = true
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(yaho ? .red : .gray)
            .frame(width:329 ,height:43 )
            .overlay{
                SecureField(text,text: $input,prompt: Text(text).foregroundStyle(yaho ? .red : .gray))
                    .padding(.leading,12)
            }
    }
}
