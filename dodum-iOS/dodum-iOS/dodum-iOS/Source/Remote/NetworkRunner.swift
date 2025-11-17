//
//  NetworkRunner.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI
import Alamofire

struct VoidResponse : Decodable {} // JSON body가 빈상태로 올때 request를 호출할 때 넣을 타입
struct EmptyParameters : Encodable {}

class NetworkRunner: ObservableObject {
    
    static let shared = NetworkRunner()
    
    let session : Session = {
        let configuration = URLSessionConfiguration.default
        
        let session = Session(configuration: configuration)
        return session
    }()
    
    func request<Parameters : Encodable, Response : Decodable>(
        _ Path : String,
        method : HTTPMethod,
        headers : HTTPHeaders? = nil,
        parameter : Parameters? = EmptyParameters(),
        response : Response.Type,
        isAuthorization : Bool = false
    ) async throws -> Response{
        let result = session.request(
            baseurl + Path,
            method: method,
            parameters : parameter,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
            .validate()
        let decodedResponse = try await result.serializingDecodable(response.self).value
        return decodedResponse
        
        }
    

        
        
        //serializingDecodable은 json을 구조체로 바꾸는 비동기 작업 생성
        // result 객체를 response 파라미터의 타입으로 디코딩하겠다는 듯임
        
    
    
    func upload(uploadurl : String,endpoint : String){}
}
