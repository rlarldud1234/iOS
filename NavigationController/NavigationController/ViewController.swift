//
//  ViewController.swift
//  NavigationController
//
//  Created by 김기영 on 2021/06/16.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    

    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : user Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.delegate = self
    }

}

