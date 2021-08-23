//
//  ViewController.swift
//  SnapKitTest2
//
//  Created by 김기영 on 2021/08/23.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var mainLabel = UILabel()
    var emailField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    var backgroundImg = UIImageView()
    var profileImg = UIImageView()
    var profileImgPicker = UIImagePickerController()
    var backgroundImgPicker = UIImagePickerController()

    override func viewDidLoad() {
        self.view.addSubview(mainLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(backgroundImg)
        self.view.addSubview(profileImg)
        
        self.mainLabeLayout()
        self.backgroundImgLayout()
        self.emailFieldLayout()
        self.passwordFieldLayout()
        self.loginBtnLayout()
        self.profileImgLayout()
        self.tapImage(imageView: backgroundImg)
        self.tapImage(imageView: profileImg)
        
        self.loginButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        self.title = "로그인"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func backgroundImgLayout() {
        backgroundImg.backgroundColor = .lightGray
        backgroundImg.snp.makeConstraints {
            $0.leading.equalTo(0)
            $0.trailing.equalTo(0)
            $0.top.equalTo(0)
        }
    }

    func profileImgLayout() {
        profileImg.layer.cornerRadius = (UIScreen.main.bounds.width - 220)/2
        profileImg.backgroundColor = .yellow
        profileImg.layer.masksToBounds = true
        profileImg.snp.makeConstraints {
            $0.leading.equalTo(110)
            $0.trailing.equalTo(-110)
            $0.top.equalTo(100)
            $0.centerX.equalTo(self.view)
        }
    }
    
    func mainLabeLayout() {
        mainLabel.text = "김기영 컴퍼스"
        mainLabel.textColor = .black
        mainLabel.sizeToFit()
        mainLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(200)
            $0.top.equalTo(backgroundImg.snp.bottom).offset(20)
            $0.top.equalTo(profileImg.snp.bottom).offset(0)
        }
    }
    
    func emailFieldLayout() {
        emailField.placeholder = "아이디를 입력하세요."
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.leading.equalTo(50)
            $0.trailing.equalTo(-50)
            $0.top.equalTo(mainLabel.snp.bottom).offset(50)
        }
    }
    func passwordFieldLayout() {
        passwordField.placeholder = "비밀번호를 입력하세요."
        passwordField.isSecureTextEntry = true
        passwordField.autocapitalizationType = .none
        passwordField.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.leading.equalTo(50)
            $0.trailing.equalTo(-50)
            $0.top.equalTo(emailField.snp.bottom).offset(50)
        }
        underLineLayout(textField: self.passwordField)
    }
    
    func loginBtnLayout() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 10
        loginButton.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.leading.equalTo(30)
            $0.trailing.equalTo(-30)
            $0.top.equalTo(passwordField.snp.bottom).offset(100)
        }
        underLineLayout(textField: emailField)
    }
    func underLineLayout(textField : UITextField) {
        let underLineView = UIView()
        self.view.addSubview(underLineView)
        underLineView.backgroundColor = .lightGray
        underLineView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalTo(48)
            $0.trailing.equalTo(-70)
            $0.top.equalTo(textField.snp.bottom).offset(12)
        }
    }
    func tapImage(imageView: UIImageView) {
            var tap = UITapGestureRecognizer()
            if imageView == backgroundImg {
                tap = UITapGestureRecognizer(target: self, action: #selector(changeBackgroundImage))
            } else {
                tap = UITapGestureRecognizer(target: self, action: #selector(changeProfileImage))
            }
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
        
        @objc func changeBackgroundImage() {
            backgroundImgPicker.sourceType = .photoLibrary
            backgroundImgPicker.allowsEditing = false
            backgroundImgPicker.delegate = self
            present(backgroundImgPicker, animated: true)
        }
        
        @objc func changeProfileImage() {
            profileImgPicker.sourceType = .photoLibrary
            profileImgPicker.allowsEditing = false
            profileImgPicker.delegate = self
            present(profileImgPicker, animated: true)
        }
        
        @objc func login() {
            guard let emailText = emailField.text else {
                return
            }
            
            guard let passwordText = passwordField.text else {
                return
            }
            
            if isValidEmailAddress(email: emailText) && isVailedPassword(password: passwordText) {
                if emailText == "hyowon@test.com" && passwordText == "1hyowon2" {
                    successAlert()
                } else {
                    joinAlert()
                }
            }
            
            if !isValidEmailAddress(email: emailText) {
                failedAlert(message: "이메일을")
            }
            
            if !isVailedPassword(password: passwordText) {
                failedAlert(message: "패스워드를")
            }
            
        }
        
        func failedAlert(message: String) {
            let alertController = UIAlertController(title: nil, message: "\(message) 다시 입력해 주세요.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        func successAlert() {
            let settingViewController = SettingViewController()
            // 이런 식으로 settingController로 넘겨 주었다.
            self.navigationController?.pushViewController(settingViewController, animated: true)
        }
        
        func joinAlert() {
            let alertController = UIAlertController(title: nil, message: "입력하신 내용으로 회원가입을 해주세요!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        func isValidEmailAddress(email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
        
        func isVailedPassword(password: String) -> Bool {
            let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
            let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: password)
        }
    }

    extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            var newImage: UIImage? = nil
            
            if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
                newImage = possibleImage
            } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                newImage = possibleImage
            }
            
            if picker == profileImgPicker {
                profileImg.image = newImage
                picker.dismiss(animated: true)
            } else if picker == backgroundImgPicker {
                backgroundImg.image = newImage
                picker.dismiss(animated: true)
            }
        }
    }



#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
