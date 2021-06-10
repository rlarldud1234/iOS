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
    
    func item() {
        do{
            let item: DataList = DataList(title: addTitle.text!, deatail: detail.text!)
            data.append(item)
            self.navigationController?.popViewController(animated: true);
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtn(_ sender : UIBarButtonItem)
    {
        self.item()
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
