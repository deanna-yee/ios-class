//
//  NintendoItemsViewController.swift
//  NintendoConsoles
//
//  Created by Deanna Yee on 10/15/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class NintendoItemsViewController: UITableViewController{
    
    //variable to access the nintendoStore
    var nintendoStore: NintendoItemStore!
    
    //gets the number of items in the nintendoStore and allows that many rows in the table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nintendoStore.allNintendoConsoles.count
    }
    
    //displays the console name, console image, and release year in the cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("NintendoItemCell", forIndexPath: indexPath)
            as! NintendoItemCell
        
        /*Set the text on the cell with the name of the console and the release year
          that is at the nth index of items, where n = row this cell
          will appear in the tableview*/
        let nintendoItem = nintendoStore.allNintendoConsoles[indexPath.row]
        cell.consoleNameLabel.text = nintendoItem.consoleName
        cell.releaseYearLabel.text = "release year: \(nintendoItem.releaseYear)"
        cell.consoleImage.image = nintendoItem.consoleImage
        return cell
    }
    
    /*table view cells not underlap the status bar
    content appear below the status bar when table view is scrolled to the top*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //Creates dynamic cell heights
        tableView.rowHeight = 115
        
    }
    
    //Delete the console from the array and also the row from the list
    override func tableView(tableView: UITableView,
                    commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                    forRowAtIndexPath indexPath: NSIndexPath){
        
        //If the table view is asking to commit a delete command through an alert
        if editingStyle == .Delete{
            let deletedConsole = nintendoStore.allNintendoConsoles[indexPath.row]
            
            let title = "Delete \(deletedConsole.consoleName)?"
            let message = "Would you like to delete this console?"
            
            let deleteAlert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            deleteAlert.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: {(action) -> Void in
                //Remove the item from the store
                self.nintendoStore.removeConsole(deletedConsole)
                
                //Remove row from the table view
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
            deleteAlert.addAction(deleteAction)
            
            //Present the alert controller
            presentViewController(deleteAlert, animated: true, completion: nil)
            
        }
    }
    
    //Moves the console from one row in the list to another row of the list
    override func tableView(tableView: UITableView,
                            moveRowAtIndexPath sourceIndexPath: NSIndexPath,
                            toIndexPath destinationIndexPath: NSIndexPath) {
        
        //Update the model
        nintendoStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
        
    }
    
    //sends the information of the item selected to the detail view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //If the triggered segue is the "ShowItem segue"
        if segue.identifier == "ShowItem"{
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row{
                
                //Get the item associated with this row and pass it along 
                let nintendoItem = nintendoStore.allNintendoConsoles[row]
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.nintendoItem = nintendoItem
            }
            
        }
    }
    
    //Creates the edit button in the navigation bar
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
}
