//
//  ViewController.swift
//  test
//
//  Created by 김기영 on 2021/06/02.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var ps : UITextField!
    @IBOutlet weak var email : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func login(email : String, ps: String)
    {
        HTTPClient().post(url: AuthAPI.login.path(), params: ["id": email, "password": ps], header: Header.tokenIsEmpty.header()).responseJSON { res in
            switch res.response?.statusCode{
            case 200:
                guard let data = res.data else {return}
                guard let model = try? JSONDecoder().decode(SignInModal.self, from: data) else {return}
                
            case 400:
                print("BAD REQUEST")
            case 401:
                print("UNAUTHORIZED")
            case 403:
                print("FORBIDDEN")
            case 404:
                print("NOT FOUND")
            case 409:
                print("CONFLICT")
            default :
                print(res.response?.statusCode)
            }
        }
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        login(email: email.text!, ps: ps.text!)
    }
}
