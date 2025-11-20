//
//  PostComposeView.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI

struct PostComposeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = etcInfoViewModel()
    @State private var selectedCategory = "학교지원"
    @State private var category = ""
    @State private var name = ""
    @State private var isAnonymous = false
    @State private var title = ""
    @State private var content = ""
    @State private var isUnderlined: Bool = false
    @State private var attributedText = NSAttributedString(string: "")
    @State private var selectedRange = NSRange(location: 0, length: 0)
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    let categories = ["학교지원", "개발도구", "강의추천"]
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                HStack {
                    Text("카테고리")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.leading, 9)
                        .padding(.trailing, 14)
                    
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(action: { selectedCategory = category }) {
                                Text(category)
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(selectedCategory == category ? Color.main : .gray)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                }
                .padding(.leading, 9)
                .padding(.top, 18)
                
                
                TextField("제목을 입력하세요", text: $title)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.bottom, 8)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3)), alignment: .bottom)
                    .padding(.horizontal, 24)
                
                EditorRichText(attributedText: $attributedText, selectedRange: $selectedRange)
                    .frame(minHeight: 200)
                    .padding(.bottom, 8)
                    .padding(.leading, 21)
                    .overlay(
                        VStack {
                            if attributedText.string.isEmpty {
                                HStack {
                                    Text("본문을 입력하세요")
                                        .foregroundColor(.gray.opacity(0.6))
                                        .padding(.top, 8)
                                        .padding(.leading, 24)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                    )
                
                VStack {
                    HStack(spacing: 20) {
                        Button {
                            viewModel.toggleBold(for: &attributedText, in: selectedRange)
                        } label: {
                            Image(systemName: "bold")
                        }
                        Button {
                            viewModel.toggleItalic(for: &attributedText, in: selectedRange)
                        } label: {
                            Image(systemName: "italic")
                        }
                        Button { viewModel.toggleUnderline(for: &attributedText, in: selectedRange)
                        } label: {
                            Image(systemName: "underline")
                        }
                        Button(action: {
                            showImagePicker = true
                        }) {
                            Image(systemName: "photo")
                        }
                        .sheet(isPresented: $showImagePicker) {
                            PickerImage(image: $selectedImage)
                                .onDisappear {
                                    if let image = selectedImage {
                                        viewModel.insertImage(image, into: &attributedText, at: selectedRange)
                                    }
                                }
                        }
                        Spacer()
                    }
                    .padding(.leading, 35)
                    .foregroundColor(.gray)
                    .padding(.bottom, 35)
                    
                    HStack(spacing: 10) {
                        Spacer()
                        Button(action: {
                            let newPost = etcInfoModel(
                                category: category.isEmpty ? "기타" : category,
                                title: title.isEmpty ? "제목 없음" : title,
                                subtitle: name.isEmpty ? "익명" : name,
                                content: attributedText.string,
                                imageName: "dodum_post_image",
                                image: selectedImage,
                                authorRole: 2,
                                isAnonymous: isAnonymous
                            )
                            viewModel.Sharearr.append(newPost)
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
            .padding(.top, 12)
            .background(Color.white)
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.3))
                    .background(Color.white)
            )
            .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 0)
            .padding(24)
            .navigationBarBackButtonHidden(true)
        }
    }
}
