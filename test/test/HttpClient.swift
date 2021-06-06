//
//  HttpClient.swift
//  test
//
//  Created by 김기영 on 2021/06/02.
//

import Foundation
import Alamofire

protocol HTTPClientProvider {
    func get(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest
    func post(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest
    func put(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest
}

class HTTPClient: HTTPClientProvider {
    let baseURL = "http://caratserver.pythonanywhere.com/user/auth"
    
    func get(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest {
        <#code#>
    }
    
    func post(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest {
        <#code#>
    }
    
    func put(url: String, params: Parameters?, heafer: HTTPHeaders) -> DataRequest {
        <#code#>
    }
    
    
}
