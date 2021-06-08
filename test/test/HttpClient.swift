//
//  HttpClient.swift
//  test
//
//  Created by 김기영 on 2021/06/02.
//

import Foundation
import Alamofire

protocol HTTPClientProvider {
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
}

class HTTPClient: HTTPClientProvider {
    let baseURL = "http://211.38.86.92:8080"
    
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url, method: .get, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: header, interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url, method: .post, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: header, interceptor: nil)
    }
    
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url, method: .put, parameters: params, encoding: JSONEncoding.prettyPrinted, headers: header, interceptor: nil)
    }
    
    
}
