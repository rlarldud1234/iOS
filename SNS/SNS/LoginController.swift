//
//  ViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/09.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var id : UITextField!
    @IBOutlet weak var ps : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        id.text = ""
        ps.text = ""
    }

    func loadData() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "item") as? [[String: AnyObject]]
        else {return}
        user = data.map{
            let id = $0["id"] as? String
            let ps = $0["ps"] as? String
            
            return LoginItem(id : id!, ps: ps!)
        }
    }

    func login() {
        for i in 0..<user.count{
            if user[i].id == id.text && user[i].ps == ps.text{
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "Screen")
                
            self.navigationController?.pushViewController(pushVC!, animated: true)
            }
        }
    }
    
    @IBAction func loginBtn(_ sender : UIButton)
    {
        login()
    }
}
 
