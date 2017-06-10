//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Deanna Yee on 8/28/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*Displays the outcome between player and computer
      Displays player choice vs. computer choice*/
    @IBOutlet var outcomeLabel: UILabel!
    
    //Displays the feedback whether player wins, loses, or ties
    @IBOutlet var outcomeFeedbackLabel: UILabel!
    
    //Called when the rock button is pushed
    @IBAction func rockChoice(sender: AnyObject){
        
        //call showResults and pass in Rock as playerChoice
        showResults("Rock")
    }
    
    //Called when the paper button is pushed
    @IBAction func paperChoice(sender: AnyObject){
        
        //call showResults and pass in Paper as playerChoice
        showResults("Paper")
        
    }
    
    //Called when the scissors button is pushed
    @IBAction func scissorsChoice(sender: AnyObject){
        
        //call showResults and pass in Scissors as playerChoice
        showResults("Scissors")
        
    }
    
    /*Determine the computer's choice through a switch statement
      Determine the outcome feedback
      Display the outcome and outcome feedback*/
    func showResults(playerChoice:String){
        
        //generate a random number between 0-2
        let ranNum:Int = Int(arc4random_uniform(3))
        
        //create an empty string to hold computer choice
        var computerChoice: String = ""
        
        //determine whether the computer's choice is rock, paper, or scissor using the ranNum
        switch ranNum{
            case 0:
                computerChoice = "Rock"
            case 1:
                computerChoice = "Paper"
            case 2:
                computerChoice = "Scissors"
            default:
                break
        }
        
        //display the player choice vs the computer choice
        outcomeLabel.text = playerChoice + " vs. " + computerChoice
        
        /*determines whether the player wins, loses, or ties against the computer
          display whether the player wins, loses, or ties*/
        switch playerChoice{
            case "Rock":
                switch computerChoice{
                    case "Rock":
                        outcomeFeedbackLabel.text = "It's a tie"
                    case "Paper":
                        outcomeFeedbackLabel.text = "You lose"
                    case "Scissors":
                        outcomeFeedbackLabel.text = "You win"
                    default:
                        break
            }
            case "Paper":
                switch computerChoice{
                    case "Rock":
                        outcomeFeedbackLabel.text = "You win"
                    case "Paper":
                        outcomeFeedbackLabel.text = "It's a tie"
                    case "Scissors":
                        outcomeFeedbackLabel.text = "You lose"
                    default:
                        break
            }
            case "Scissors":
                switch computerChoice{
                    case "Rock":
                        outcomeFeedbackLabel.text = "You lose"
                    case "Paper":
                        outcomeFeedbackLabel.text = "You win"
                    case "Scissors":
                        outcomeFeedbackLabel.text = "It's a tie"
                    default:
                        break
            }
            default:
                break
        }
        
    }
    
    //Only show the rock, paper, scissors buttons at start up
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set outcome and outcomeFeedback to empty string
        outcomeLabel.text = ""
        outcomeFeedbackLabel.text = ""
    }

}

