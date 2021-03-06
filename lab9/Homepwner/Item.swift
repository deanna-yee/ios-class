//
//  Item.swift
//  Homepwner
//
//  Created by Deanna Yee on 9/29/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: NSDate
    
    //Initalizer
    init(name: String, serialNumber: String?, valueInDollars: Int){
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
        
        super.init()
    }
    
    //Convenience Initalizer
    convenience init(random: Bool = false){
        if random{
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx =  arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID().UUIDString.componentsSeparatedByString("-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        }
        else{
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
        
    }
}
