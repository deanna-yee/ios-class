//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Deanna Yee on 9/4/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

//import Foundation
import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate{
    
    //displays the conversion in yens
    @IBOutlet var yensLabel: UILabel!
    
    //Outlet to the textField to dismiss the keyboard
    @IBOutlet var textField: UITextField!
    
    //stores the value in the textField
    var usDollars: Double? {
        didSet{
            updateYensLabel()
        }
    }
    
    /*conversion from U.S. dollar to yen
     $1 U.S. dollar = 104 yens*/
    //converts U.S. Dollars to Yens
    var yensValue: Double? {
        if let value = usDollars {
            return value * 104
        }
        else{
            return nil
        }
    }
    
    //creates a formatter to display the currency in japanese/yens
    let japanCurrencyFormatter: NSNumberFormatter = {
        let japanLocale = NSLocale(localeIdentifier:"ja_JP")
        let jcf = NSNumberFormatter()
        jcf.numberStyle = .CurrencyStyle
        jcf.locale = japanLocale
        return jcf
    }()
    
    //creates a formatter that only allows two decimal places
    let decimalFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    /*Sets the value in the textField to usDollars if there is one
     otherwise yensLabel doesn't display*/
    @IBAction func usDollarFieldEditingChanged(textField:UITextField){
        if let text = textField.text, value = decimalFormatter.numberFromString(text){
            usDollars = Double(value)
        }
        else{
            yensLabel.text = textField.text
        }
        
    }
    
    //checks to see if input has at most two decimal places
    func checkDecimalPlaces(textField: UITextField, newInput: String?) -> Bool{
        if let inputText = textField.text{
            //keeps track of how many places after the decimal there is
            var numberOfDecimalPlaces = 0
            
            //Determines if the character is after the decimal point
            var afterDecimalPoint = false
            
            for ch in inputText.characters{
                if ch == "." || newInput == "."{
                    afterDecimalPoint = true
                }
                else if (afterDecimalPoint == true) && (newInput != ""){
                    numberOfDecimalPlaces += 1
                }
            }
            
            if numberOfDecimalPlaces >= 2{
                return false
            }
        }
        return true
    }
    
    //dismisses the keyboard when the background is tapped
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    //displays the yens conversion of the U.S. currency
    func updateYensLabel(){
        if let value = yensValue{
            yensLabel.text = japanCurrencyFormatter.stringFromNumber(value)
        }

    }
    

    //only allows numbers, one decimal point, and two decimal places
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                    replacementString string: String) -> Bool{
        
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
            //allows at most two decimal places
            if(checkDecimalPlaces(textField, newInput: string) == true){
                //only allows numbers and one decimal point
                if (replacementTextOnlyDigits == true) || (replacementTextHasDecimalSeparator != nil)
                {
                    return true
                }
                
                else{
                    return false
                }
            }
            else{
                return false
            }
        }
    }
    
    //at start up display ??? as the yens currency
    override func viewDidLoad(){
        super.viewDidLoad()
        yensLabel.text = "???"
    }
    
    
}