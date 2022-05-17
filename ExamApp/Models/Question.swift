//
//  Question.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/4/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

class Question :NSObject, Decodable {
    
    var text :String
    var point :Double
    var isCorrect :Bool
    
}
