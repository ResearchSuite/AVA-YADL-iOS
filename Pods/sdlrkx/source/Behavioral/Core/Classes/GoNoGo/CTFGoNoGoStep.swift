//
//  CTFGoNoGoStep.swift
//  ResearchKit
//
//  Created by Francesco Perera on 9/28/16.
//  Copyright © 2016 researchkit.org. All rights reserved.
//

import Foundation
import ResearchKit


open class CTFGoNoGoStep: ORKStep {
    
    var goNoGoParams:CTFGoNoGoStepParameters?
    
    open override func stepViewControllerClass() -> AnyClass {
        return CTFGoNoGoStepViewController.self
    }
}
