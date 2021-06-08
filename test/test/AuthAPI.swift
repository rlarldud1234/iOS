//
//  SignUpAPI.swift
//  test
//
//  Created by 김기영 on 2021/06/08.
//

import Foundation

enum AuthAPI: API{
    
    case signup
    case login
    
    func path() -> String {
        switch self {
        case .signup:
            return "/signup"
        case .login:
            return "/auth"
        }
    }
    
}
