//
//  ViewController.swift
//  image view
//
//  Created by 김기영 on 2021/06/06.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn : UIImage?
    var imgOff : UIImage?

    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var btn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "우리 영웅이.jpeg")
        imgOff = UIImage(named: "우리 영웅이2.jpeg")
        
        img.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth : CGFloat, newHeight:CGFloat
        
        if (isZoom) {
            newWidth = img.frame.width/scale
            newHeight = img.frame.height/scale
            btn.setTitle("확대", for: .normal)
        }
        else{
            newWidth = img.frame.width*scale
            newHeight = img.frame.height*scale
            btn.setTitle("축소", for: .normal)
        }
        img.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }

    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            img.image = imgOn
        }
        else {
            img.image = imgOff
        }
    }
}

