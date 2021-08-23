//
//  ViewController.swift
//  snapkitTests
//
//  Created by 김기영 on 2021/08/21.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let label = UILabel().then {
        $0.backgroundColor = .black
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.text = "사랑해 김영웅"
    }
    
    let txt = UITextField().then {
        $0.backgroundColor = UIColor.white
        $0.textColor = UIColor.black
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.black.cgColor
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textAlignment = .left
    }
    
    let txt1 = UITextView().then {
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        
    }
    
    let addbtn = UIButton().then {
        $0.backgroundColor = .systemPink
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        
    }
    
    func setUpView() {
        self.view.addSubview(self.label)
        self.view.addSubview(self.txt)
        self.view.addSubview(self.txt1)
        
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(300)
            $0.center.equalTo(self.view)
            }
        
        txt.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(80)
        }
        
        txt1.snp.makeConstraints {
            $0.top.equalTo(self.label.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.bottom.equalToSuperview().offset(-50)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpView()
        self.makeAddBtn()
    }


    @objc
    func didTapAddBtn(_ sender : UIButton){
        label.text! = txt.text!
        txt1.text = txt.text!
    }
    
    private func makeAddBtn() {
        self.view.addSubview(self.addbtn)
        
        self.addbtn.addTarget(self, action: #selector(didTapAddBtn(_:)), for:  .touchUpInside)
        
        addbtn.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.top.equalTo(self.txt.snp.bottom).offset(30)
            $0.height.equalTo(80)
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
