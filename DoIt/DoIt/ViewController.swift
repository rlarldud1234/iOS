//
//  ViewController.swift
//  DoIt
//
//  Created by 김기영 on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbName : UILabel!
    @IBOutlet weak var txtField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn(_sender : UIButton)
    {
        lbName.text = "Hello, " + txtField.text! + "!!!!"
    }


}

