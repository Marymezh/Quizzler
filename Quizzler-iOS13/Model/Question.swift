//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Maria Mezhova on 05.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: [String]
    
    // task3: one more parametr - array of answers - is added 
    var rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}
