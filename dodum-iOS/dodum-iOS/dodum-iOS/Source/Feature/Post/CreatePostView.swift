//
//  CreatePostView.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ShareViewModel
    @State private var selectedCategory = "학교지원"
    @State private var name = ""
    @State private var isAnonymous = false
    @State private var title = ""
    @State private var content: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    let categories = ["학교지원", "개발도구", "강의추천"]
    var endpoint: String = ""
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    headerView()
                    
                    TextField("제목을 입력하세요", text: $title)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 8)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3)), alignment: .bottom)
                        .padding(.horizontal, 24)
                    
                    ScrollView {
                        VStack(spacing: 8) {
                            if let selectedImage = selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(12)
                                    .padding(.horizontal, 20)
                            }
                            
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $content)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 5)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                
                                if content.isEmpty {
                                    Text("본문을 입력하세요")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .padding(.top, 12)
                                        .padding(.leading, 8)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
//                    HStack(spacing: 20) {
//                        Button {
//                            viewModel.toggleBold(for: &content)
//                        } label: {
//                            Image(systemName: "bold")
//                        }
//                        
//                        Button {
//                            viewModel.toggleItalic(for: &content)
//                        } label: {
//                            Image(systemName: "italic")
//                        }
//                        
//                        Button {
//                            viewModel.toggleUnderline(for: &content)
//                        } label: {
//                            Image(systemName: "underline")
//                        }
//                        
//                        PhotosPicker(selection: $selectedItem, matching: .images) {
//                            Image(systemName: "photo")
//                                .font(.title2)
//                                .foregroundColor(.gray)
//                        }
//                        .onChange(of: selectedItem) { newItem in
//                            Task {
//                                if let data = try? await newItem?.loadTransferable(type: Data.self),
//                                   let uiImage = UIImage(data: data) {
//                                    selectedImage = uiImage
//                                }
//                            }
//                        }
//                        
//                        Spacer()
//                    }
//                    .font(.system(size: 20))
//                    .padding(.leading, 35)
//                    .foregroundColor(.gray)
//                    .padding(.bottom, 35)
                    
//                    HStack(spacing: 10) {
//                        Spacer()
//                        Button(action: {
//                            let newPost = ShareModel(
//                                category: selectedCategory,
//                                title: title.isEmpty ? "제목 없음" : title,
//                                subtitle: name.isEmpty ? "익명" : name,
//                                content: content,
//                                imageName: "",
//                                authorRole: 2,
//                                isAnonymous: isAnonymous,
//                                image: selectedImage
//                            )
//                            viewModel.Sharearr.append(newPost)
//                            dismiss()
//                        }) {
//                            Text("게시")
//                                .font(.system(size: 20))
//                                .padding(.horizontal, 24)
//                                .padding(.vertical, 8)
//                                .background(Color.main)
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
//                        }
//                        
//                        Button(action: { dismiss() }) {
//                            Text("취소")
//                                .font(.system(size: 20))
//                                .padding(.horizontal, 24)
//                                .padding(.vertical, 8)
//                                .background(Color.gray)
//                                .foregroundStyle(.white)
//                                .cornerRadius(8)
//                        }
//                    }
//                    .padding(.bottom, 14)
//                    .padding(.trailing, 24)
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(22)
                .navigationBarBackButtonHidden(true)
            }
        }
//        .onAppear {
//            if viewModel.Sharearr.isEmpty {
//                viewModel.Sharearr = [
//                    ShareModel(category: "학교지원", title: "샘플 포스트 1", subtitle: "홍길동", content: "본문 내용 1", imageName: "", authorRole: 2, isAnonymous: false),
//                    ShareModel(category: "개발도구", title: "샘플 포스트 2", subtitle: "익명", content: "본문 내용 2", imageName: "", authorRole: 2, isAnonymous: true)
//                ]
//            }
//        }
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        switch endpoint {
        case "share/post":
            TextField("학번 이름을 입력하세요", text: $name)
                .padding(.horizontal, 24)
                .font(.system(size: 17))
                .textFieldStyle(.roundedBorder)
        case "etcInfo/post":
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
        default:
            Text("yaho")
        }
    }
}
