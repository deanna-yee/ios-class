//
//  NintendoItemStore.swift
//  NintendoConsoles
//
//  Created by Deanna Yee on 10/15/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class NintendoItemStore{
    //Stores the names of the consoles
    let consoleNames = ["Nintendo Entertainment System",
                        "Super Nintendo Entertainment System",
                        "Nintendo 64",
                        "GameCube",
                        "Wii",
                        "Wii U",
                        "Gameboy",
                        "Gameboy Color",
                        "Gameboy Advance",
                        "Gameboy Advance SP",
                        "Nintendo DS",
                        "Nintendo 3DS"]
    
    //Stores the release years of the consoles
    let consoleReleaseYears = [1985,
                               1990,
                               1996,
                               2001,
                               2006,
                               2012,
                               1989,
                               1998,
                               2001,
                               2003,
                               2004,
                               2011]
    
    //Stores the image names of the consoles
    let consoleImageNames = ["NES.png",
                         "SNES.png",
                         "N64.png",
                         "Gamecube.png",
                         "Wii.png",
                         "WiiU.png",
                         "Gameboy.png",
                         "GameBoyColor.png",
                         "GameBoyAdvance.png",
                         "GameBoyAdvanceSP.png",
                         "DS.png",
                         "3DS.png"]
    
    //Stores all consoles with their name, release year, and image
    var allNintendoConsoles = [NintendoItems]()
    
    //Creates a new NintendoItems and stores it in the allNintendoConsoles array
    func createNintendoItem(index:Int) -> NintendoItems{
        
        //Create the UIImage from the image file
        let image: UIImage = UIImage(named: consoleImageNames[index])!
       
        //Creates a NintendoItem with the consolename, releaseYear, and an image of the console
        let newNintendoItem = NintendoItems(consoleName: consoleNames[index], releaseYear: consoleReleaseYears[index],
                                            consoleImage: image)
        
        //store the nintendoItem in an array
        allNintendoConsoles.append(newNintendoItem)
        return newNintendoItem
        
    }
    
    //Create all NintendoItems
    init(){
        for i in 0..<consoleNames.count{
            createNintendoItem(i)
        }
    }
    
    //Deletes the nintendoItem from the list when the delete dutton is pushed
    func removeConsole(item: NintendoItems){
        if let index = allNintendoConsoles.indexOf(item){
            allNintendoConsoles.removeAtIndex(index)
        }
    }
    
    //Moves console from one index of the array to another index of the array if the two indexes are not equal
    func moveItemAtIndex(fromIndex: Int, toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        
        //Get reference to object being moved so you can reinsert it
        let movedConsole = allNintendoConsoles[fromIndex]
        
        //Remove console from array
        allNintendoConsoles.removeAtIndex(fromIndex)
        
        //Insert item in array at new location
        allNintendoConsoles.insert(movedConsole, atIndex: toIndex)
    }
}
