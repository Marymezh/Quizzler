//
//  Quiz brain.swift
//  Quizzler-iOS13
//
//  Created by Maria Mezhova on 06.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation


struct QuizBrain {
   
    // task3: the list of questions is changed
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    
    // task2: adding a score change logic - var score to store the value of the current score
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        // task3: checking for the answer is right or wrong
        if userAnswer == quiz[questionNumber].rightAnswer {
            // task2: if answer is correct the score is increasing by 1, if wrong - nothing changes
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    // task3: adding text for the button from quiz 
    func getAnswerText() -> [String] {
        return quiz[questionNumber].answer
    }
    
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float (quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            // task2: at the end of the quiz we reset the score back to zero to start over again
            questionNumber = 0
            score = 0
        }
    }
    // task2: function getScore simply returns the value of the score, which goes back to the controller in updateUI function
    mutating func getScore() -> Int {
        return score
    }
}

