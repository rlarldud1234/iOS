//
//  DetailViewController.swift
//  TableViewController
//
//  Created by 김기영 on 2021/06/22.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem : String = ""
    
    @IBOutlet var lblitem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblitem.text = receiveItem
    }
    
    func reciveItem(_ item : String)
    {
        receiveItem = item
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
