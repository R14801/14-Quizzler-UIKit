//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var scoreText: UILabel!
    
    var quizBrain = QuizBrain()
    let haptics=UIImpactFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.checkAnswer(sender.currentTitle!){
            haptics.impactOccurred()
            sender.backgroundColor = UIColor.green
        } else {
            haptics.impactOccurred()
            sender.backgroundColor = UIColor.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.quizBrain.nextQuestion()
            self.updateUI()
        }
        
        
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].text
        optionOne.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[0], for: UIControl.State.normal)
        optionTwo.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[1], for: UIControl.State.normal)
        optionThree.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[2], for: UIControl.State.normal)
        optionOne.backgroundColor = UIColor.clear
        optionTwo.backgroundColor = UIColor.clear
        optionThree.backgroundColor = UIColor.clear
        progressBar.progress =  quizBrain.getProgress()
        scoreText.text = "Score: \(quizBrain.correctQuestions)"
        
    }
    
}

