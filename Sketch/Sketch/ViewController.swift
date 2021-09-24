//
//  ViewController.swift
//  Sketch
//
//  Created by 김기영 on 2021/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txfLineWidth: UITextField!
    
    // 바로 전에 터치하거나 이동한 위치
    var lastPoint: CGPoint!
    // 선의 두께를 2.0으로 설정
    var lineSize: CGFloat = 2.0
    // 선의 색상을 빨간색으로 설정
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLineBlack(_ sender: UIButton) {
        lineSize = 2.0
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnLineRed(_ sender: UIButton) {
        lineSize = 2.0
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnLineGreen(_ sender: UIButton) {
        lineSize = 10.0
        lineColor = UIColor.white.cgColor
    }
    
    @IBAction func btnLineBule(_ sender: UIButton) {
        lineSize = 2.0
        lineColor = UIColor.blue.cgColor
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        lineSize += 1.0
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        lineSize -= 1.0
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        // 이미지 뷰의 이미지를 삭제함
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 현재 발생한 터치 이벤트를 가지고 옴
        let touch = touches.first! as UITouch
        // 터치된 위치를 lastPoint에 할당
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 그림을 그리기 위한 콘텍스트 생성
        UIGraphicsBeginImageContext(imgView.frame.size)
        // 선 색상을 설정
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        // 선 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        // 선 두께를 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        // 현재 발생한 터치 이벤트를 가지고 옴
        let touch = touches.first! as UITouch
        // 터치된 좌표를 currPoint로 가지고 옴
        let currPoint = touch.location(in: imgView)
        
        // 현재 imgView에 있는 전체 이미지를 imgView의 크기로 그림
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        // lastPoint 위치로 시작 위치를 이동
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        // lastPoint에서 currPoint까지 선을 추가
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        // 추가한 선을 콘텍스트에 그림
        UIGraphicsGetCurrentContext()?.strokePath()
        
        // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 할당
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        // 그림 그리기를 끝냄
        UIGraphicsEndImageContext()
        
        // 현재 터치된 위치를 lastPoint라는 변수에 할당
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // 폰을 흔드는 모션이 발생하면
        if motion == .motionShake {
            // 이미지 뷰의 이미지를 삭제함
            imgView.image = nil
        }
    }
}
