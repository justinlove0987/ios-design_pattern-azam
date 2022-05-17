//
//  QuestionJSONStrategy.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class QuestionJSONStrategy :NSObject, QuestionStrategy {
    
    var questions :[Question] = [Question]()
    dynamic var questionIndex :Int = 0
    var currentQuestion :Question!
    
    func nextQuestion() -> Question {
        
        if questionIndex >= questions.count {
            return self.currentQuestion
        }
        
        self.currentQuestion = questions[questionIndex]
        questionIndex += 1
        return self.currentQuestion
    }
    
    required init(name :String) {
        print("foo - \(name)")
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let questionsDictionary = try! JSONDecoder().decode([String:[Question]].self, from: data)
            
            if let qs = questionsDictionary["questions"] {
                questions = qs
            }
            
        }
        
    }
    
}
