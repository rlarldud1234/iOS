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
    
    var okay : String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        self.id.layer.cornerRadius = 10
        self.ps.layer.cornerRadius = 10
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
        
        if id.text == ""  || ps.text == "" {
            let alert = UIAlertController(title: "경고", message: "입력되어지지 않았습니다. 다시 확인하세요!!", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(OkAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            for i in 0..<user.count{
                if user[i].id == id.text && user[i].ps == ps.text{
                    okay = "okay"
                }
            }
            if okay == "okay" {
                guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "Screen") else { return }
                self.navigationController?.pushViewController(pushVC, animated: true)
            }
            else
            {
                let alert = UIAlertController(title: "경고", message: "비밀번호랑 아이디를 제대로 입력되었는지 다시 확인해주세요!", preferredStyle: .alert)
                let CancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(CancelAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    @IBAction func loginBtn(_ sender : UIButton)
    {
        login()
    }
}




