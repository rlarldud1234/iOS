//
//  SignupViewController.swift
//  test
//
//  Created by 김기영 on 2021/06/02.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var ps : UITextField!
    @IBOutlet weak var name : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func signup(email : String, ps: String, name: String)
    {
        HTTPClient().post(url: AuthAPI.signup.path(), params: ["name": name, "email": email, "password": ps], header: Header.tokenIsEmpty.header()).responseJSON { res in
            switch res.response?.statusCode{
            case 201:
                print("ㅊㅋ요")
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
    
    @IBAction func signupBtn(_ sender: UIButton) {
        signup(email: email.text!, ps: ps.text!, name: name.text!)
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


