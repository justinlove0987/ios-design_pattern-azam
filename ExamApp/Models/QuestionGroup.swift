//
//  QuestionGroup.swift
//  ExamApp
//
//  Created by Mohammad Azam on 9/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation

enum QuestionOrderType: Int {
    case sequential
    case random
    
    static var allCases: [QuestionOrderType] = [.sequential, .random]
    
    var title: String {
        switch self {
        case .sequential: return "Sequential"
        case .random: return "Random"
        }
    }
}

enum SourceType :String {
    case json
    case xml
}

enum Course :String {
    case math
    case geography
}

struct QuestionGroup {
    
    var displayName :String 
    var course :Course 
    var sourceType :SourceType = .json
    
}
