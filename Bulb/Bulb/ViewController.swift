//
//  ViewController.swift
//  Bulb
//
//  Created by 김기영 on 2021/06/13.
//

import UIKit

class ViewController: UIViewController {

    let imgOn = UIImage(named: "lamp-on.png")
    
    let imgOff = UIImage(named: "lamp-off.png")
    
    let imgRemove = UIImage(named: "우리 영웅이.jpeg")
    
    var isLampOn : Bool = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네.", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAlction = UIAlertAction(title: "야내요", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAlction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampRemove(_ sender:UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하십겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

