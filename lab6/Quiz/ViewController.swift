//
//  ViewController.swift
//  Quiz
//
//  Created by Deanna Yee on 8/24/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Label that displays the question
    //@IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    //Label that displays the next question
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    //Label that displays the answer to the question
    @IBOutlet var answerLabel: UILabel!
    
    //An array of questions to be displayed
    let questions: [String] = ["From what is cognac made?",
                               "What is 7 + 7",
                               "What is the capital of Vermont?"]
    
    //An array of answers to the questions in the question array
    let answers:[String] = ["Grapes",
                            "14",
                            "Montpelier"]
    
    //index for the question and answer arrays
    //keeps track of the question the user is on
    var currentQuestionIndex: Int = 0
    
    //Activates when Next Question button is pressed
    @IBAction func showNextQuestion(sender: AnyObject){
        
        //Increment currentQuestionIndex by 1
        //Same as ++currentQuestionIndex
        currentQuestionIndex += 1
        
        //resets currentQuestionIndex to 0 once it reaches the size of the array
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        //a new question is picked from the question array
        //displayed to questionLabel
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        
        //no answer is displayed to answerLabel
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    //Activates when Show Answer button is pressed
    @IBAction func showAnswer(sender: AnyObject){
        
        //get the answer to the question from the answer array
        //display the answer to the question to the answerLabel
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    //Activates just after the application is launched
    override func viewDidLoad(){
       super.viewDidLoad()
        
        //displays the first question after the application is launched
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    //animates the label's transitions
    func animateLabelTransitions(){
        /*let animationClosure = { () -> Void in
            self.questionLabel.alpha = 1
        }*/
        
        //Force any oustanding layout changes to occur
        view.layoutIfNeeded()
        
        //animate the alpha
        //and the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animateWithDuration(0.5, delay: 0,
            options: [.CurveLinear],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
            },
            completion: {_ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                self.updateOffScreenLabel()
            })
    }
    
    override func viewWillAppear(animated:Bool){
        super.viewWillAppear(animated)
        
        //set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }

}

