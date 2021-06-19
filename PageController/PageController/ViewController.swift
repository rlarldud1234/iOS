//
//  ViewController.swift
//  PageController
//
//  Created by 김기영 on 2021/06/19.
//

import UIKit
 
var images = ["우리 영웅이.jpeg", "우리 영웅이2.jpeg" ]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageController: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageController.numberOfPages = images.count
        
        pageController.currentPage = 0
        
        pageController.pageIndicatorTintColor = UIColor.green
        
        pageController.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageController.currentPage])
    }
    

}

