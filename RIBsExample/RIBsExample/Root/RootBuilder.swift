//
//  RootBuilder.swift
//  RIBsExample
//
//  Created by 김기영 on 2023/01/04.
//

import RIBs

protocol RootDependency: Dependency {
}

final class RootComponent: Component<RootDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        return RootRouter(interactor: interactor, viewController: viewController, loggedOutBuilder: loggedOutBuilder)
    }
}
