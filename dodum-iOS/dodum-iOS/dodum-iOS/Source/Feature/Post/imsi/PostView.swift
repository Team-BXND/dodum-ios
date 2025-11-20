//
//  PostView.swift
//  dodum-iOS
//
//  Created by maple on 11/19/25.
//

import SwiftUI

struct PostView: View {
    @Environment(\.dismiss) var dismiss
    @State var title : String = ""
    @State private var showImagePicker = false
    @State private var attributedText : String = ""
    @State private var selectedRange = NSRange(location: 0, length: 0)
    @State var endpoint = "archive/post"
    @State var name = ""
    @State private var selectedCategory = "학교지원"
    let categories = ["학교지원", "개발도구", "강의추천"]
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            
            VStack{
                headerView()
                
                TextField("제목을 입력하세요", text: $title)
                    .font(.semibold(24))
                    .padding(.bottom, 8)
                    .padding(.top,8)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3)), alignment: .bottom)
                    .padding(.horizontal, 24)
                
                ZStack{
                    if attributedText.isEmpty {
                        VStack{
                            HStack{
                                Text("본문을 입력하세요")
                                    .foregroundStyle(.gray.opacity(0.6))
                                    .padding(.top,8)
                                    .padding(.leading,24)
                                    .font(.regular(20))
                                Spacer()
                                
                            }
                            Spacer()
                        }
                    }
                    TextEditor(text: $attributedText)
                        .padding(.leading,24)
                        .opacity(0)
                }
                
                
                VStack{
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            Image(systemName: "bold")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "italic")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "underline")
                        }
                        
                        Button(action: { showImagePicker = true }) {
                            Image(systemName: "photo")
                        }
                        //                        .sheet(isPresented: $showImagePicker) {
                        //                            ImagePicker(image: $selectedImage)
                        //                        }
                        
                        Spacer()
                    }
                    .font(.system(size: 20))
                    .padding(.leading, 35)
                    .foregroundColor(.gray)
                    .padding(.bottom, 35)
                    
                    HStack(spacing: 10) {
                        Spacer()
                        
                        Button(action: {
                            // 게시 동작
                            dismiss()
                        }) {
                            Text("게시")
                                .font(.system(size: 20))
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color.main)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button(action: { dismiss() }) {
                            Text("취소")
                                .font(.system(size: 20))
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color.gray)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.bottom, 14)
                    .padding(.trailing, 24)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(22)
        .navigationBarBackButtonHidden(true)
    }
    @ViewBuilder
    private func headerView() -> some View {
        switch endpoint {
        case "etc/post":
            HStack {
                Text("카테고리")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.trailing, 14)
                    .padding(.leading, 9)
                
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: { selectedCategory = category }) {
                            Text(category)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(selectedCategory == category ? Color.main : .gray)
                                .padding(.trailing, 16)
                        }
                    }
                }
                .padding(.trailing, 23)
            }
            .padding(.top, 15)
        case "archive/post":
            VStack{
                HStack{
                    Text("카테고리")
                        .font(.medium(18))
                    Spacer()
                }
                .padding(.bottom,4)
                
                HStack(spacing: 12) {
                    ForEach(["동아리", "나르샤", "대회 수상작", "미니프로젝트"], id: \.self) { category in
                        Button(action: { selectedCategory = category }) {
                            Text(category)
                                .font(.medium(17))
                                .foregroundColor(selectedCategory == category ? Color.main : .gray)
                                .padding(.trailing, 16)
                        }
                    }
                }
                
            }
            .padding(.top,17)
            .padding(.horizontal,12)
        default:
            EmptyView()
        }
    }
}

#Preview {
    PostView()
}


