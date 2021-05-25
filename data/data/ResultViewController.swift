//
//  ResultViewController.swift
//  data
//
//  Created by 김기영 on 2021/05/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var label : UILabel!
    var result = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = result
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
