//
//  ViewController.swift
//  snapkit
//
//  Created by 김기영 on 2021/08/20.
//

import UIKit

class ViewController: UIViewController{

    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
        
    }
    @IBAction func addBtn(_ sender : Any){
        let alert = UIAlertController(title: "", message: "원하는 메세지",
                                      preferredStyle: .actionSheet)
        let libary = UIAlertAction(title: "갤러리", style: .default, handler:
                                    { ACTION in self.openLibary()})
        let camera = UIAlertAction(title: "카메라", style: .default, handler:
                                    { ACTION in self.openCamera()})
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(libary)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}


    extension ViewController :UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openLibary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else {
            print("Camera not available")
        }
    }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imageView.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        }
    
}
