//
//  RootComponent+LoggedOut.swift
//  RIBsExample
//
//  Created by 김기영 on 2023/01/04.
//

import RIBs

protocol RootDependencyLoggedOut: Dependency {
    
}

extension RootComponent: LoggedOutDependency {
}
