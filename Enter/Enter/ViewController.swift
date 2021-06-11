//
//  ViewController.swift
//  Enter
//
//  Created by 김기영 on 2021/06/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text : UITextField!
    
    @IBOutlet weak var Label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.text.delegate = self
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // textField.resignFirstResponder(
        if textField == self.text {
            Label.text! = text.text!
            // 원하는 액션 지정하기
                }
        return true
    }
    
}

