//
//  MainFlow.swift
//  RxFlowTest
//
//  Created by 김기영 on 2021/11/18.
//

import Foundation
import RxFlow

class MainFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
       guard let step = step as? TestStep else {return .none}
        switch step {
        case .loginIsRequires:
            return .end(forwardToParentFlowWithStep: TestStep.mainIsRequires)
        case .mainIsRequires:
            return self.navigateMain()
        }
    }
    
    private func navigateMain() -> FlowContributors {
        let viewController = MainViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
