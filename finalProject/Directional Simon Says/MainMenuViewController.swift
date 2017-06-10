//
//  MainMenuViewController.swift
//  Directional Simon Says
//
//  Created by Deanna Yee on 12/9/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class MainMenuViewController: UIViewController {
    
    //Change from using Core Data to storing data on two files
 
    
    //scoreStore for the whole application
    var scoreStore : ScoreStore!
    
    //passes the store to the table or to the tap simon says controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "scores" {
            let topTenViewController = segue.destinationViewController as!
                ScoreTabBarController
            topTenViewController.scoreStore = scoreStore
        }
        else if segue.identifier == "Tap" {
            let tapSimonSaysViewController = segue.destinationViewController as! TapSimonSaysViewController
            tapSimonSaysViewController.scoreStore = scoreStore
        }
        else if segue.identifier == "Swipe"{
            let swipeSimonSaysViewController = segue.destinationViewController as! SwipeSimonSaysViewController
            swipeSimonSaysViewController.scoreStore = scoreStore
        }
        
        
        
    }
    
    
    
}
