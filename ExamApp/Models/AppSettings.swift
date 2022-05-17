//
//  AppSettings.swift
//  ExamApp
//
//  Created by justin on 2022/5/16.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation

class AppSettings {
    
    private init() { }
    static var shared = AppSettings()
    
    private struct Keys {
        static var questionOrderType = "questionOrderType"
    }
    
    var questionOrderType :QuestionOrderType {
        
        get {
            
            let userDefaults = UserDefaults.standard
            let rawValue = userDefaults.integer(forKey: Keys.questionOrderType)
            return QuestionOrderType(rawValue: rawValue)!
            
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: Keys.questionOrderType)
        }
    }
    
}
