//
//  SignupView.swift
//  dodum-iOS
//
//  Created by maple on 10/29/25.
//

import SwiftUI

struct SignupView: View {
    @State var step = 1
    @StateObject var s = SignupViewModel()
    @State var input : String = ""
    var body: some View {
        VStack {
            switch step {
            case 1:
                GetAccountInfoView(sign: s, gonext: $step)
            case 2:
                GetPersonalInfoView(signupVM: s, gonext: $step)
            case 3:
                GetVerificate(sign: s)
            default:
                GetAccountInfoView(sign: s, gonext: $step)
            }
        }
    }
}


#Preview {
    SignupView()
}
