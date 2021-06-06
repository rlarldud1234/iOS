//
//  ViewController.swift
//  rlarldud
//
//  Created by 김기영 on 2021/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text : UITextField!
    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn(_ sender : UIButton)
    {
        label.text = text.text
    }

}

