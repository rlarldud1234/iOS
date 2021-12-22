//
//  ViewController.swift
//  Soket.iOTest
//
//  Created by 김기영 on 2021/12/21.
//

import UIKit
import FlexLayout
import PinLayout
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let container: UIView = UIView()
    var disposeBag = DisposeBag()
    
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "아직 비어있음"
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    let txtField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "아무 글씨나 입력해주세요"
        
        return txtField
    }()
    
    let btn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("버튼", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(container)
        view.backgroundColor = .white
        setup()
        setBtn()
    }
    
    override func viewDidLayoutSubviews() {
        container.pin.all()
        container.flex.layout()
    }
    
    private func setup() {
        container.flex.padding(40).define { flex in
            [label, txtField, btn].forEach{flex.addItem($0).height(50)}
        }
    }
    
    private func setBtn() {
        btn.rx.tap.subscribe { [unowned self] _ in
            label.text = txtField.text
        }.disposed(by: disposeBag)
    }
    
    
}

