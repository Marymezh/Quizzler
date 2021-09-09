//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    // task 3: one more button for answer is added and all the rest buttuns are renamed
    @IBOutlet weak var choise1Button: UIButton!
    @IBOutlet weak var choise2Button: UIButton!
    @IBOutlet weak var choise3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else { return }
        let rightAnswer = quizBrain.checkAnswer(userAnswer)
        
        if rightAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()

        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func  updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        // calling for the answer button titles from the quizBrain 
        
        let answerChoices = quizBrain.getAnswerText()
        choise1Button.setTitle(answerChoices[0], for: .normal)
        choise2Button.setTitle(answerChoices[1], for: .normal)
        choise3Button.setTitle(answerChoices[2], for: .normal)
        
        choise1Button.backgroundColor = .clear
        choise2Button.backgroundColor = .clear
        choise3Button.backgroundColor = .clear
        progressBar.progress = quizBrain.getProgress()
//        task2: calling for the score from quiz brain to be printed
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
    
    
    

}

