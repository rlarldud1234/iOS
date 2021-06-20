//
//  ViewController.swift
//  DatePicker
//
//  Created by 김기영 on 2021/06/06.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet weak var IbCurrentTime: UILabel!
    @IBOutlet weak var IbPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let DatePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IbPickerTime.text = "선택시간 : " + formatter.string(from: DatePickerView.date)
    }
    
    @objc func updateTime() {
//        IbCurrentTime.text = String(count)
//        count = count+1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:ss EEE"
        IbCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }

}

