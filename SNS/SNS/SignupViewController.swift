//
//  SignupViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/09.
//

import UIKit

struct LoginItem {
    var id : String = ""
    var ps : String = ""
    var email : String = ""
    var name : String = ""
}
var user = [LoginItem]()
class SignupViewController: UIViewController {

    @IBOutlet weak var id : UITextField!
    @IBOutlet weak var ps : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var poket : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.poket.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    
    func setData() {
        let Data = user.map{
            [
                "id" : $0.id,
                "ps" : $0.ps,
                "email" : $0.email,
                "name" : $0.name
            ]
        }
        let userDeafaults = UserDefaults.standard
        userDeafaults.set(Data, forKey: "item")
        userDeafaults.synchronize()
        
    }
    
    @IBAction func enter(_ sender : UIButton)
    {
        user.append(LoginItem(id: id.text!, ps: ps.text!, email: email.text!, name: name.text!))
        setData()
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
