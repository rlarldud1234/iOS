//
//  ExpansionViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/06/10.
//

import UIKit

class ExpansionViewController: UIViewController {

    var titleItem = String()
    var detailItem : String = ""
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var detailLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.text! = titleItem
        detailLabel.text! = detailItem
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
