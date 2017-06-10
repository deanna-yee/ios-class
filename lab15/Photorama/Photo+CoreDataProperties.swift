//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Deanna Yee on 11/30/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @NSManaged var photoID: String
    @NSManaged var photoKey: String
    @NSManaged var title: String
    @NSManaged var dateTaken: NSDate
    @NSManaged var remoteURL: NSURL
    @NSManaged var tags: Set<NSManagedObject>

}
