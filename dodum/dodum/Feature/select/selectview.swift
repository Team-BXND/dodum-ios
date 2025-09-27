//
//  selectview.swift
//  dodum
//
//  Created by maple on 9/24/25.
//

import SwiftUI

struct selectview: View {
    @StateObject var selectVM = selectviewmodel()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(selectVM.arr){item in
                    selectitem(num: item.num,topic: item.topic)
                        .padding(.bottom,40)
                }
                Button("야호"){
                    
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    selectview()
}
