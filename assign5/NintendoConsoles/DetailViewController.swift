//
//  DetailViewController.swift
//  NintendoConsoles
//
//  Created by Deanna Yee on 10/28/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    //Label for the name of the console
    @IBOutlet var name: UILabel!
    
    //Label for the release year of the console
    @IBOutlet var releaseYear: UILabel!
    
    //Image view for the image of the console
    @IBOutlet var consoleImage: UIImageView!
    
    //Label for more detail of the console
    @IBOutlet var consoleDescription: UILabel!
    
    //nintendo item selected
    var nintendoItem: NintendoItems! {
        didSet{
            navigationItem.title = nintendoItem.consoleName
        }
    }
    
    //sets all the labels and image view to the item's information
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        name.text = "name: \(nintendoItem.consoleName)"
        releaseYear.text = "release year: \(nintendoItem.releaseYear)"
        consoleImage.image = nintendoItem.consoleImage
        consoleDescription.text = "description: \(nintendoItem.consoleDescription)"
    }
    
}
