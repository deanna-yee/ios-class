//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Deanna Yee on 8/28/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Label to display the answer from the magic8ball
    @IBOutlet var answerLabel: UILabel!
    
    //20 possible random answers for the magic8ball
    let answers: [String] = ["It is certain.",
                             "It is decidedly so.",
                             "Without a doubt.",
                             "Yes - definitely.",
                             "You may rely on it.",
                             "As I see it, yes.",
                             "Most likely.",
                             "Outlook good.",
                             "Signs point to yes.",
                             "Yes.",
                             "Reply hazy, try again.",
                             "Ask again later.",
                             "Better not tell you now.",
                             "Cannot predict now.",
                             "Concentrate and ask again.",
                             "Don't count on it.",
                             "My reply is no.",
                             "My sources say no.",
                             "Outlook not so good.",
                             "Very doubtful."]
    
    /*Generate a random array index
      Display the random answer in the label*/
    @IBAction func showAnswer(sender: AnyObject){
        
        /*20 = the count of answers array
          Finds a random number between 0-19*/
        //Index for the answers array
        let ranNum:Int = Int(arc4random_uniform(UInt32(answers.count)))
        
        /*Gets the answer at index ranNum
          Displays the answer to answerLabel*/
        let answer:String = answers[ranNum]
        answerLabel.text = answer
    }
    
    /*Display the image and button at start up
      Set answer label to an empty string at start up*/
    override func viewDidLoad(){
        super.viewDidLoad()
        answerLabel.text = ""
    }


}

