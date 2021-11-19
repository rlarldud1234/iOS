//
//  ViewController.swift
//  RxFlowTest
//
//  Created by 김기영 on 2021/11/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class MainViewController: UIViewController, Stepper{
    
    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("버튼", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    let disposebag = DisposeBag()
    
    var steps = PublishRelay<Step>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        btn.rx.tap.subscribe(onNext: { _ in
            self.steps.accept(TestStep.loginIsRequires)
        }).disposed(by: disposebag)
    }

}

