//
//  ViewController.swift
//  Quizzler
//
//  Created by Tony Alhwayek on 09/21/2023
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    // Answer buttons
    @IBOutlet var firstAnswer: UIButton!
    @IBOutlet var secondAnswer: UIButton!
    @IBOutlet var thirdAnswer: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.textAlignment = .center
        quizBrain.quiz.shuffle()
        
        updateUI()
    }
    
    @objc func updateUI() {
        // Reset background colors
        firstAnswer.backgroundColor = .clear
        secondAnswer.backgroundColor = .clear
        thirdAnswer.backgroundColor = .clear
        
        // Update question text
        questionLabel.text = quizBrain.getQuestionText()
        
        // Update answers and shuffle answer array
        var answers = quizBrain.getAnswers()
        answers.shuffle()
        firstAnswer.setTitle(answers[0], for: .normal)
        secondAnswer.setTitle(answers[1], for: .normal)
        thirdAnswer.setTitle(answers[2], for: .normal)
        
        // Update score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // Update progress bar
        progressBar.progress = quizBrain.getProgress()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.title(for: .normal) == quizBrain.getCorrectAnswer() {
            sender.backgroundColor = .green
            // Increase score
            quizBrain.score += 1
        } else {
            sender.backgroundColor = .red
        }
        
        // Get the next array element (question and answers)
        quizBrain.getNextQuestion()
        
        // Set a small delay before calling updateUI so that the user can see whether their answer was correct or not
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}

