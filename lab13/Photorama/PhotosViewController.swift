//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Deanna Yee on 11/18/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class PhotosViewController: UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("Successfully found \(photos.count) recent photos.")
                
                if let firstPhoto = photos.first{
                    self.store.fetchImageForPhoto(firstPhoto) {
                        (ImageResult) -> Void in
                        
                        switch ImageResult {
                        case let .Success(image):
                            //self.imageView.image = image
                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                self.imageView.image = image
                            }
                        case let .Failure(error):
                            print("Error downloading image: \(error)")
                        }
                    }
                }
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            }
        }
    }
    
    
}
