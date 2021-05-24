//
//  ViewController.swift
//  Calculator
//
//  Created by 김기영 on 2021/04/20.
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLable: UILabel!    // 결과 레이블 설정
    
    var a:Bool = false  // false true 값이 필요해서 만들어진 것
    var result: Double = 0  // 결과값을 실수로 선언
    var middleNum1: Double = 0  // 중간값1을 실수로 선언
    var middleNum2: Double = 0  // 중간값2을 실수로 선언
    var operater1 = String()    // 연산자을 문자열로 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: UIButton){  // 버튼 능력 만들기
        if let realValue = resultLable.text{    // 결과레이블에 있는 텍스트의 값을 realValue에 넣어줌
            middleNum2 = Double(realValue) ?? 0 // 중간값2는 더블타입의 realValue값을 가진다
        }
        switch operater1 {
        case "+":   // 더하기버튼이 눌리면 중간값끼리 더한다
            result = middleNum1 + middleNum2
        case"-":    // 빼기버튼이 눌리면 중간값끼리 뺀다
            result = middleNum1 - middleNum2
        case"x":    // 곱하기버튼이 눌리면 중간값끼리 곱한다
            result = middleNum1 * middleNum2
        case"/":    // 나누기버튼이 눌리면 중간값끼리 나눈다
            result = middleNum1 / middleNum2
        default:
            return
        }
        resultLable.text = "\(result)"  // 리저트 레이블에 리저트를 넣는다.
    }
    @IBAction func numBtn(_ sender : UIButton) {
        let num = sender.currentTitle!
        
        if a{                               // a가 true일 때 사용된다.(처음부터는 사용이 안된다. 왜냐하면 a를 false로 값을 넣어주었기 때문에
            let b = resultLable.text!
            resultLable.text = b + num
        }
        else {                          // a가 false일 때 사용된다.
            resultLable.text = num      // 클릭을 해서 거기 나와 있는 숫자가 num에 저장된다. 그것이 reslult text에 쓰여진다.
        }
        a = true        // a가 true로 바뀐다. 그래서 if문 처음으로 넘어감
    }
    @IBAction func erasebtn(_ sender : UIButton) {  // 버튼능력을 심어줌
        result = 0          // 결과 값이 초기화됨
        a=false             // a를 다시 false로 만들어줘서 값이 넣어질 때 처음부터 되도록 만들어줌
        middleNum1 = 0      // 중간 값이 초기화됨
        middleNum2 = 0      // 중간 값이 초기화됨
        resultLable.text = "0"  // 레이블에 텍스트를 0으로 만들어줌으로써 다시 쓸수 있게 만들어줌
    }
    @IBAction func operaterBtn(_ sender : UIButton){    //연산자 버튼의 버튼 능력을 심어줌
        let opertater = sender.currentTitle!        // 오퍼레이터라는 상수에 누른 버튼에 써져 있는 연산자가 오퍼레이터에 들어감
        
        operater1 = opertater       // 문자열로 만들어준 오퍼레이터1에다가 오퍼레이터를 넣어줌

        if let realValue = resultLable.text {   // 레이블에 써져 있는 텍스트를 realValue에 넣어줌
            middleNum1 = Double(realValue) ?? 0 //중간값1에 더블타입의 realValue를 넣어줌
        }
        resultLable.text = "0"
        a = false
    }

}

