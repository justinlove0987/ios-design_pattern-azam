//
//  QuestionStrategy.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

@objc protocol QuestionStrategy {
    
    var questions :[Question] { get set }
    var questionIndex :Int { get set }
    
    init(name :String)
    
    func nextQuestion() -> Question 
    
}
