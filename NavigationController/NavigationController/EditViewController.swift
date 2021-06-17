//
//  EditViewController.swift
//  NavigationController
//
//  Created by 김기영 on 2021/06/16.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message : String)
    func didImageOnOffDone(_ contoller: EditViewController, isOn : Bool)
}
class EditViewController: UIViewController {

    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    var isOn : Bool = false
    
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var swisOn : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swisOn.isOn = isOn
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch){
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
