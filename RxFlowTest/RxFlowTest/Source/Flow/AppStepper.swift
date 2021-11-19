//
//  AppStepper.swift
//  RxFlowTest
//
//  Created by 김기영 on 2021/11/18.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    private let disposebag = DisposeBag()
    
    init() {}
    
    var initialStep: Step {
        return TestStep.loginIsRequires
    }
}
