//
//  ViewController.swift
//  data
//
//  Created by 김기영 on 2021/05/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segLabel : UILabel!
    @IBOutlet var segment: UISegmentedControl!
    
    let array : [String] = ["red","blue","green"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segLabel.clipsToBounds = true
        segLabel.layer.cornerRadius = 75.0
        
        self.view.addSubview(self.segment)
        self.view.addSubview(self.segLabel)
    }
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        var color : UIColor!
        var text : String!
        
        switch sender.selectedSegmentIndex {
        case 0:
            color = UIColor.red
            text = "red"
        case 1:
            color = UIColor.blue
            text = "blue"
        case 2:
            color = UIColor.green
            text = "green"
        default : return
        }
        self.segLabel.backgroundColor = color
        self.segLabel.text = text
    }
}

