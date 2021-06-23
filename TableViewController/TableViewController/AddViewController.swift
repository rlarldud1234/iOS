//
//  AddViewController.swift
//  TableViewController
//
//  Created by 김기영 on 2021/06/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: Any) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("우리 영웅이.jpeg")
        tfAddItem.text = ""
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
