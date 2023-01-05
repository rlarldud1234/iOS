//
//  LoggedOutViewController.swift
//  RIBsExample
//
//  Created by 김기영 on 2023/01/04.
//

import RIBs
import RxSwift
import UIKit
import RxCocoa
import SnapKit
import Then

protocol LoggedOutPresentableListener: AnyObject {
    func login(id: String, password: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    private var disposeBag = DisposeBag()

    private let idTextField = UITextField().then {
        $0.placeholder = "id"
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
    }
    private let passwordTextField = UITextField().then {
        $0.placeholder = "password"
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
    }
    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .blue
        $0.setTitle("로그인", for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButton()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.addSubviews()
        self.makeSubviewConstraints()
    }

    private func setButton() {
        self.loginButton.rx.tap
            .subscribe(onNext: {
                self.listener?.login(id: self.idTextField.text ?? "", password: self.passwordTextField.text ?? "")
            }).disposed(by: disposeBag)
    }
}

extension LoggedOutViewController {
    func addSubviews() {
        [idTextField, passwordTextField, loginButton].forEach { view.addSubview($0) }
    }
    func makeSubviewConstraints() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }
}
