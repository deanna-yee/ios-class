//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Deanna Yee on 9/7/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    //label to display the degrees in celsius
    @IBOutlet var celsiusLabel:UILabel!
    
    //variable for the fahrenheitValue that is typed into the text field
    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    /*converts the fahrenheitValue to celsius
     nil if there is no value*/
    var celsiusValue:Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    //variable for the text field
    @IBOutlet var textField: UITextField!
    
    /*set the fahrenheitValue to the value in the textField
     nil if there is no value in the textField*/
    @IBAction func fahrenheitFieldEditingChanged(textField:UITextField){
        
        /*if let text = textField.text where !text.isEmpty{
            celsiusLabel.text = textField.text
         }else{
            celsiusLabel.text = "???"
         }*/
        
        if let text = textField.text, value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    //lowers the keyboard when the background to tapped
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    /*displays the value of the degrees in celsius if there is a value in the textField
     otherwise displays ??? when there is no values*/
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            //celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celsiusLabel.text = "???"
        }
    }
    
    //customizes the display of a number to display only one decimal place at most
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //doesn't allow more than one decimal point or anything except numbers
    func textField(textField: UITextField,
            shouldChangeCharactersInRange range: NSRange,
            replacementString string: String) -> Bool {
        
        /*print("Current text: \(textField.text)")
          print("Replacement text: \(string)")
          return true*/
        
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        //creates a characterSet of only numbers
        let replacementTextAllCharacters = NSCharacterSet(charactersInString: string)
        let replacementTextOnlyDigits = NSCharacterSet.decimalDigitCharacterSet().isSupersetOfSet(replacementTextAllCharacters)
        
        //only allows one decimal point
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil{
            return false
        }
        else{
            //only allows numbers and one decimal point
            if (replacementTextOnlyDigits == true) || (replacementTextHasDecimalSeparator != nil)
            {
                return true
            }
           
            else{
                return false
            }
        }
    }
    
    //prints to the console when conversion view controller appears the first time
    override func viewDidLoad(){
        //Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
    }
    
}
