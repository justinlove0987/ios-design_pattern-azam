//
//  QuestionStrategyObservable.swift
//  ExamApp
//
//  Created by justin on 2022/5/17.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

@objcMembers class QuestionStrategyObservable: NSObject {
    dynamic var strategy: QuestionStrategy!
    
    init(strategy: QuestionStrategy) {
        self.strategy = strategy
    }
}
