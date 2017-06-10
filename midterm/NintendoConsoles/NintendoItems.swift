//
//  NintendoItems.swift
//  NintendoConsoles
//
//  Created by Deanna Yee on 10/15/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class NintendoItems: NSObject {
    //stores the name of the Nintendo console/
    var consoleName: String
    
    //stores the year the console was released
    var releaseYear: Int
    
    //stores an image of the console
    var consoleImage: UIImage
    
    //Constructor that creates a NintendoItem with the consoleName, releaseYear, and an image of the console
    init(consoleName: String, releaseYear: Int, consoleImage: UIImage){
        self.consoleName = consoleName
        self.releaseYear = releaseYear
        self.consoleImage = consoleImage
        
        super.init()
    }
}
