//
//  AddDataViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/09.
//

import UIKit

struct DataList {
    var title : String = ""
    var deatail : String = ""
}

var data = [DataList]()
class AddDataViewController: UIViewController {

    @IBOutlet weak var addTitle : UITextField!
    @IBOutlet weak var detail : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
