//
//  loginViewController.swift
//  login
//
//  Created by 김기영 on 2021/05/26.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textlabel : UILabel!
    @IBOutlet weak var idLabel : UILabel!
    @IBOutlet weak var psLabel : UILabel!
    @IBOutlet weak var idTextField : UITextField!
    @IBOutlet weak var psTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textlabel.isHidden = true
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "item") as? [loginItem] else {
            return
        }
        print(data)
    }
    
    func login()
    {
        for i in 0...user.count {
            if user[i].id == idTextField.text && user[i].ps == psTextField.text{
                textlabel.isHidden = false
            }
        }
    }
    @IBAction func loginBtn(_ sender:UIButton)
    {
        login()
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
