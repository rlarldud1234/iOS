//
//  SignupViewController.swift
//  login
//
//  Created by 김기영 on 2021/05/26.
//

import UIKit

struct loginItem {
    var id : String = ""
    var ps : String = ""
    var name : String = ""
    var key : String = ""
    var idealType : String = ""
}
var user = [loginItem]()
class SignupViewController: UIViewController {

    @IBOutlet weak var id : UITextField!
    @IBOutlet weak var ps : UITextField!
    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var key : UITextField!
    @IBOutlet weak var idealType : UITextField!
    
    func setData(){
        let userDefaults = UserDefaults.standard
        userDefaults.set(user, forKey: "item")
        userDefaults.synchronize()
    }
    
    @IBAction func enter(_ sender : UIButton)
    {
        
        user.append(loginItem(id: id.text!, ps: ps.text!, name: name.text!, key: key.text!, idealType: idealType.text!))
        setData()
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
