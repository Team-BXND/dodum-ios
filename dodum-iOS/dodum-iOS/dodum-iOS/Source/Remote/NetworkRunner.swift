//
//  NetworkRunner.swift
//  dodum-iOS
//
//  Created by maple on 9/27/25.
//

import SwiftUI
import Alamofire

class NetworkRunner: ObservableObject {
    
    static let shared = NetworkRunner()
    
    let session : Session = {
        let configuration = URLSessionConfiguration.default
        
        let session = Session(configuration: configuration)
        return session
    }()
}
