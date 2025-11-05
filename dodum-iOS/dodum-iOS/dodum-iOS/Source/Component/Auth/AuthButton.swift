//
//  AuthButton.swift
//  dodum-iOS
//
//  Created by maple on 10/22/25.
//

import SwiftUI

struct AuthButton: View {
    var text : String = ""
    var action : () -> Void
    var body: some View {
        Button{
            
        }label: {
            ZStack{
                Rectangle()
                    .frame(width: 330,height: 40)
                    .cornerRadius(8)
                    .foregroundStyle(.main)
                Text(text)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    
            }
        }
    }
}

