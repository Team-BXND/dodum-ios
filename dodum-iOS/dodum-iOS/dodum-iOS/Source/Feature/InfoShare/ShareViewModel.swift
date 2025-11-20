//
//  ShareViewModel.swift
//  dodum-iOS
//
//  Created by 잇쬬 on 10/27/25.
//

import SwiftUI
import PhotosUI
import Alamofire

@MainActor
class ShareViewModel: ObservableObject {
    @Published var Sharearr: [ShareModel] = [
        ShareModel(id: 1, title: "제목", author: "저자", likes: 1, view: 1, comment: 1, Image: "Sample")
    ]
    @Published var DetailInfo : DetailModel = DetailModel(title: "", content: "", author: "", Date: Date())
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let network = NetworkRunner.shared
    
    // HTML -> AttributedString 변환
    func attributedContent(from htmlString: String) -> AttributedString {
        let fullHTML = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <style>
                body {
                    font-family: -apple-system, BlinkMacSystemFont, sans-serif;
                    font-size: 17px;
                }
            </style>
        </head>
        <body>
            \(htmlString)
        </body>
        </html>
        """
        
        guard let data = fullHTML.data(using: .utf8) else {
            return AttributedString(htmlString)
        }
        
        if let nsAttributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) {
            return AttributedString(nsAttributedString)
        }
        
        return AttributedString(htmlString)
    }
    
    // 포스트 불러오기
    
    func fetchList() async {
        isLoading = true
        errorMessage = nil
        do {
            let response = try await network.request(
                "Info",
                method: .get,
                response: ShareResponse.self
            )
            Sharearr = response.data
        } catch {
            errorMessage = "게시글 불러오기 실패: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    
    func fetchDetail(id : Int) async {
        do{
            let response = try await NetworkRunner.shared.request("Info/\(id)", method: .get, response: DetailModel.self)
            DetailInfo = response
        } catch {
            
        }
    }
}

// 모델 / 에러
struct ImageUploadResponse: Codable {
    let imageUrl: String
}

enum UploadError: Error {
    case invalidImage
}
