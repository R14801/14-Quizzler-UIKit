//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Rajat Nagvenker on 7/26/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var correctQuestions = 0
    var wrongQuestions = 0
    
    let quiz = [
        Question(text: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], cAnswer: "Skin"),
        Question(text: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], cAnswer: "100"),
        Question(text: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], cAnswer: "Greenwich Mean Time"),
        Question(text: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], cAnswer: "Chapeau"),
        Question(text: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], cAnswer: "Watch"),
        Question(text: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], cAnswer: "Adiós"),
        Question(text: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], cAnswer: "Orange"),
        Question(text: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], cAnswer: "Rum"),
        Question(text: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], cAnswer: "Gorilla"),
        Question(text: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], cAnswer: "Australia")
    ]
    
    func getQuestionsText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber)/Float(quiz.count)
    }
    
    func getScore() -> Int {
        return correctQuestions
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
        questionNumber+=1
        } else {
            questionNumber = 0
            print("Correct Questions: \(correctQuestions)")
            print("Wrong Questions: \(wrongQuestions)")
            correctQuestions=0
            wrongQuestions=0
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].cAnswer {
            correctQuestions += 1
            return true
        } else {
            wrongQuestions+=1
            return false
        }
    }
}
