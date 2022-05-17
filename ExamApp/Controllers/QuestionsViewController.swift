//
//  QuestionsTableViewController.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/4/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class QuestionsViewController :UIViewController {
    
    @IBOutlet weak var questionTextLabel :UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    var observable: QuestionStrategyObservable!
    
    var questionGroup :QuestionGroup!
    private var questions = [Question]()
    
    var questionStrategy :QuestionStrategy!
    
    let appSettings = AppSettings.shared
    
    private var keyValueObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = questionGroup.displayName
        
        populateQuestions()
        
//        print("foo - caseIterable \(QuestionOrderType.allCases)")
    }
    
    private func populateQuestions() {
        
        switch questionGroup.sourceType {
            case .json:
                self.questionStrategy = QuestionJSONStrategy(name: questionGroup.course.rawValue)
            case .xml:
                print("foo - XML Strategy")
//                self.questionStrategy = QuestionXMLStrategy(name :questionGroup.course.rawValue)
        }
        
        self.observable = QuestionStrategyObservable(strategy: questionStrategy)
        self.keyValueObservation = self.observable.observe(\.strategy?.questionIndex, options: [.new]) { object, change in
            self.questionNumberLabel.text = "\(object.strategy.questionIndex)/\(object.strategy.questions.count)"
        }
        
        showQuestion()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.keyValueObservation = nil
    }
    
    private func showQuestion() {
        if appSettings.questionOrderType == .random {
            questionStrategy.questions.shuffle()
        }
        
        let question = questionStrategy.nextQuestion()
        self.questionTextLabel.text = question.text
    }
    
    @IBAction func nextQuestionButtonPressed() {
       showQuestion()
    }
    
    
}

