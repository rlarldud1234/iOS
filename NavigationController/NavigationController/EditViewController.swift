//
//  EditViewController.swift
//  NavigationController
//
//  Created by 김기영 on 2021/06/16.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message : String)
}
class EditViewController: UIViewController {

    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"
        {
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"
        {
            editViewController.textWayValue = "segue : use Bar button"
        }
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
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
