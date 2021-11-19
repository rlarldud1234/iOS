//
//  AppFlow.swift
//  RxFlowTest
//
//  Created by 김기영 on 2021/11/18.
//

import Foundation
import RxFlow
import UIKit

class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? TestStep else { return .none }
        switch step {
        case .loginIsRequires:
            return self.navigateToLogin()
        case .mainIsRequires:
            return self.navigateToMain()
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: TestStep.loginIsRequires)))
    }
    
    private func navigateToMain() -> FlowContributors {
        let mainFlow = MainFlow()
        Flows.use(mainFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: TestStep.mainIsRequires)))
    }
}
