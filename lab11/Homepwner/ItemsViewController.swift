//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Deanna Yee on 9/29/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class ItemsViewController: UITableViewController{
    //MARK - variables
    var itemStore: ItemStore!
    
    var imageStore: ImageStore!
    
    //MARK - Actions
    @IBAction func addNewItem(sender: AnyObject) {
        //Make a new index path for the 0th section, last row
        /*let lastRow = tableView.numberOfRowsInSection(0)
         let indexPath = NSIndexPath(forRow: lastRow, inSection: 0)
         
         //Insert this new row into the table
         tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)*/
        
        //Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //Figure out where that item is in the array
        if let index = itemStore.allItems.indexOf(newItem){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            
            //Insert this new row into the table
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    /*@IBAction func toggleEditingMode(sender: AnyObject) {
        //if you are currently in editing mode...
        if editing {
            //Change text of button to inform user of state
            sender.setTitle("Edit", forState: .Normal)
            
            //Turn off editing mode
            setEditing(false, animated: true)
        }
        else {
            //Change text of button to inform user of state
            sender.setTitle("Done", forState: .Normal)
            
            //Enter editing mode
            setEditing(true, animated: true)
        }
    }*/
    
    
   //MARK - override functions
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Create an instance of UITableVIewCell, with default appearance
       // let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")
        
        //Get a new or recycled cell
        /*let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)*/
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
            as! ItemCell
        
        //Update the labels for the new preferred text size
        cell.updateLabels()
        
        //Set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        /*cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"*/
        
        //Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        /*let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets*/
        
        //tableView.rowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(tableView: UITableView,
            commitEditingStyle editingStyle: UITableViewCellEditingStyle,
            forRowAtIndexPath indexPath: NSIndexPath){
        
        //If the table view is asking to commit a delete command...
        if editingStyle == .Delete{
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive,
                                             handler: {(action) -> Void in
            
            //Remove the item form the store
            self.itemStore.removeItem(item)
                                                
            //Remove the item's image from the image store
            self.imageStore.deleteImageForKey(item.itemKey)
            
            //Also remove that row from the table view with an animation
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
            ac.addAction(deleteAction)
            
            //Present the alert controller
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView,
            moveRowAtIndexPath sourceIndexPath: NSIndexPath,
            toIndexPath destinationIndexPath: NSIndexPath) {
        //Update the model
        itemStore.moveItemAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //If the triggered seque is the "ShowItem" segue
        if let row = tableView.indexPathForSelectedRow?.row{
            
            //Get the item associated with this row and pass it along
            let item = itemStore.allItems[row]
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.item = item
            detailViewController.imageStore = imageStore
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK - Initializer
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
}
