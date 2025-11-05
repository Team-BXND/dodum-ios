//
//  SelectResult.swift
//  dodum-iOS
//
//  Created by maple on 10/31/25.
//

import SwiftUI

struct SelectResult: View {
    var body: some View {
        ScrollView{
            VStack{
                Image(.selectresult)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3,x : -3, y: -4)
                    .frame(width: 320,height: 200)
                    .overlay{
                        VStack{
                            Text("iOS 개발자란?")
                            Text("iOS개발자는 Apple의 모바일 운영체제인 iOS에서 동작하는 애플리케이션을 개발하는 소프트웨어 개발자입니다.")
                            Text("사용스택 : Swift")
                        }
                    }
            }
        }
    }
}

#Preview {
    SelectResult()
}
