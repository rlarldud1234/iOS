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
    }
    
    let addbtn = UIButton().then {
        $0.tintColor = .black
        $0.backgroundColor = .white
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        
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
            $0.height.equalTo(40)
            $0.width.equalTo(50)
            $0.top.equalTo(self.txt.snp.bottom).offset(30)
            $0.leading.equalTo(50)
            
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
    }
    
    private func makeAddBtn() {
        self.view.addSubview(self.addbtn)
        
        self.addbtn.addTarget(self, action: #selector(didTapAddBtn(_:)), for:  .touchUpInside)
        
        addbtn.snp.makeConstraints {
            $0.trailing.leading.equalTo(self.view)
            $0.top.equalTo(self.txt.snp.bottom).offset(40)
        }
    }
}

