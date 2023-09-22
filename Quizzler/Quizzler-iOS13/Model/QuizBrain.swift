//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Tony Alhwayek on 09/21/2023
//

import Foundation

struct QuizBrain {
    var quiz = [
        Question(question: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(question: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(question: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    //MARK: - Question and answers methods
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    // Get next question
    mutating func getNextQuestion() {
        // Update value if within range
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            // Else reset count to restart quiz
            questionNumber = 0
            score = 0
        }
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getCorrectAnswer() -> String {
        return quiz[questionNumber].correctAnswer
    }
    
    //MARK: - Progress methods
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    //MARK: - Score methods
    func getScore() -> Int {
        return score
    }
    
    
}
