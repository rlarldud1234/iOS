//
//  AppComponent.swift
//  RIBsExample
//
//  Created by 김기영 on 2023/01/04.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
