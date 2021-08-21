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
        $0.backgroundColor = .systemBlue
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textAlignment = .right
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.label)
        self.view.addSubview(self.txt)
            label.snp.makeConstraints { (make) in
                make.height.equalTo(100)
                make.width.equalTo(300)
                make.center.equalTo(self.view)
            }
        txt.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.top.equalTo(label.snp.bottom).offset(10)
        }
    }


}

