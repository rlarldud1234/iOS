//
//  ViewController.swift
//  NavigationController
//
//  Created by 김기영 on 2021/06/16.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "우리 영웅이.jpeg")
    let imgOff = UIImage(named: "우리 영웅이2.jpeg")
    
    var isOn = true
    
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
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
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)  {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }
        else{
            imgView.image = imgOff
            self.isOn = false
        }
    }

}

