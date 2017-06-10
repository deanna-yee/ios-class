//
//  Photo.swift
//  Photorama
//
//  Created by Deanna Yee on 11/30/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import CoreData
import UIKit


class Photo: NSManagedObject {
    
    var image: UIImage?
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        //Give the properties their initial values
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().UUIDString
        dateTaken = NSDate()
    }
    
    func addTagObject(tag: NSManagedObject) {
        let currentTags = mutableSetValueForKey("tags")
        currentTags.addObject(tag)
    }
    
    func removeTagObject(tag: NSManagedObject) {
        let currentTags = mutableSetValueForKey("tags")
        currentTags.removeObject(tag)
    }

}
