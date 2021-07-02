//
//  SignupViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/09.
//

import UIKit

struct LoginItem {
    var id : String
    var ps : String
}
var user = [LoginItem]()
class SignupViewController: UIViewController {
    
    @IBOutlet weak var id : UITextField!
    @IBOutlet weak var ps : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var name : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.id.layer.cornerRadius = 10
        self.ps.layer.cornerRadius = 10
        self.email.layer.cornerRadius = 10
        self.name.layer.cornerRadius = 10
    }
    
    func setData() {
        let Data = user.map{
            [
                "id" : $0.id,
                "ps" : $0.ps
            ]
        }
        let userDeafaults = UserDefaults.standard
        userDeafaults.set(Data, forKey: "item")
        userDeafaults.synchronize()
        
    }
    
    @IBAction func enter(_ sender : UIButton)
    {
        
        
        if id.text == ""  || ps.text == "" || email.text == "" || name.text == ""{
            let alert = UIAlertController(title: "경고", message: "입력되어지지 않았습니다. 다시 확인하세요!!", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(OkAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            user.append(LoginItem(id: id.text!, ps: ps.text!))
            setData()
            self.navigationController?.popViewController(animated: true)
        }
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
