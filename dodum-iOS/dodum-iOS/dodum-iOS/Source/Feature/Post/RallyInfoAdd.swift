//import SwiftUI
//
//struct RallyInfoAdd: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var name = ""
//    @State private var isAnonymous = false
//    @State private var title = ""
//    @State private var content = ""
//    @State private var attributedText = NSAttributedString(string: "")
//    @State private var selectedRange = NSRange(location: 0, length: 0)
//    @State private var showImagePicker = false
//    @State private var selectedImage: UIImage?
//    
//    var endpoint: String = ""
//    
//    var body: some View {
//        ZStack {
//            Color.background
//            
//            NavigationStack {
//                VStack {
//                    headerView()
//                    
//                    TextField("제목을 입력하세요", text: $title)
//                        .font(.system(size: 20, weight: .bold))
//                        .padding(.bottom, 8)
//                        .overlay(Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.3)), alignment: .bottom)
//                        .padding(.horizontal, 24)
//                    
//                    RichTextEditor(attributedText: $attributedText, selectedRange: $selectedRange)
//                        .frame(minHeight: 200)
//                        .padding(.bottom, 8)
//                        .padding(.leading, 21)
//                        .overlay(
//                            VStack {
//                                if attributedText.string.isEmpty {
//                                    HStack {
//                                        Text("본문을 입력하세요")
//                                            .foregroundColor(.gray.opacity(0.6))
//                                            .padding(.top, 8)
//                                            .padding(.leading, 24)
//                                        Spacer()
//                                    }
//                                }
//                                Spacer()
//                            }
//                        )
//                    
//                    VStack {
//                        HStack(spacing: 20) {
//                            Button {
//                                toggleBold()
//                            } label: {
//                                Image(systemName: "bold")
//                            }
//                            
//                            Button {
//                                toggleItalic()
//                            } label: {
//                                Image(systemName: "italic")
//                            }
//                            
//                            Button {
//                                toggleUnderline()
//                            } label: {
//                                Image(systemName: "underline")
//                            }
//                            
//                            Button(action: { showImagePicker = true }) {
//                                Image(systemName: "photo")
//                            }
////                            .sheet(isPresented: $showImagePicker) {
////                                ImagePicker(image: $selectedImage)
////                            }
//                            
//                            Spacer()
//                        }
//                        .font(.system(size: 20))
//                        .padding(.leading, 35)
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 35)
//                        
//                        HStack(spacing: 10) {
//                            Spacer()
//                            
//                            Button(action: {
//                                // 게시 처리 로직
//                                dismiss()
//                            }) {
//                                Text("게시")
//                                    .font(.system(size: 20))
//                                    .padding(.horizontal, 24)
//                                    .padding(.vertical, 8)
//                                    .background(Color.main)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(8)
//                            }
//                            
//                            Button(action: { dismiss() }) {
//                                Text("취소")
//                                    .font(.system(size: 20))
//                                    .padding(.horizontal, 24)
//                                    .padding(.vertical, 8)
//                                    .background(Color.gray)
//                                    .foregroundStyle(.white)
//                                    .cornerRadius(8)
//                            }
//                        }
//                        .padding(.bottom, 14)
//                        .padding(.trailing, 24)
//                    }
//                }
//                .background(Color.white)
//                .cornerRadius(20)
//                .padding(22)
//                .navigationBarBackButtonHidden(true)
//            }
//        }
//    }
//    
//    // MARK: - Header View
//    @ViewBuilder
//    private func headerView() -> some View {
//        switch endpoint {
//        case "share/post":
//            TextField("학번 이름을 입력하세요", text: $name)
//                .padding(.horizontal, 24)
//                .font(.system(size: 17))
//                .textFieldStyle(.roundedBorder)
//            
//        default:
//            EmptyView()
//        }
//    }
//    
//    // MARK: - Text Formatting Actions
//    private func toggleBold() {
//        // Bold 기능 구현 예정
//    }
//    
//    private func toggleItalic() {
//        // Italic 기능 구현 예정
//    }
//    
//    private func toggleUnderline() {
//        // Underline 기능 구현 예정
//    }
//}
//
//#Preview {
//    RallyInfoAdd()
//}
