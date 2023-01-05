//
//  RootViewController.swift
//  RIBsExample
//
//  Created by 김기영 on 2023/01/04.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {
    
    weak var listener: RootPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        present(viewController.uiviewController, animated: false)
    }
}
