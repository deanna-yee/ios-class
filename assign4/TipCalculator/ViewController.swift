//
//  ViewController.swift
//  TipCalculator
//
//  Created by Deanna Yee on 10/2/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //formats the tip and total for the 15% and custom tip to U.S. currency
    let USCurrencyFormatter: NSNumberFormatter = {
        let usLocale = NSLocale(localeIdentifier:"en_US")
        let uscf = NSNumberFormatter()
        uscf.numberStyle = .CurrencyStyle
        uscf.locale = usLocale
        return uscf
    }()
    
    //the amount given in the text field
    var amount: Double? {
        didSet{
            update15Labels()
            updateCustomLabels()
        }
    }
    
    //calculates the total for the 15%
    var total15Percent: Double? {
        if let value = amount, tip = tip15Percent {
            return value + tip
        }
        else{
            return nil
        }
    }
    
    //calculates the tip for the 15%
    var tip15Percent: Double? {
        if let value = amount {
            return (value * 0.15)
        }
        else{
            return nil
        }
    }
    
    //the custom tip percent from the slider
    var sliderPercent: Int? {
        didSet{
            updateCustomLabels()
        }
    }
    
    //calculates the total for the custom tip percent
    var totalCustomPercent: Double? {
        if let value = amount, percent = tipCustomPercent {
            return value + percent
        }
        else{
            return nil
        }
    }
    
    //calculates the tip for the custom tip percent
    var tipCustomPercent: Double? {
        if let value = amount, percent = sliderPercent{
            return value * (Double(percent)/100)
        }
        else{
            return nil
        }
    }
    
    //displays the custom tip percent of the slider
    @IBOutlet var customTipPercent: UILabel!
    
    //displays the tip at 15%
    @IBOutlet var tip15: UILabel!
    
    //displays the total after tip for 15%
    @IBOutlet var total15: UILabel!
    
    //displays the tip percent selected from the slider
    @IBOutlet var tipPercent: UILabel!
    
    //displays the tip for the custom tip percentage selected
    @IBOutlet var customTip: UILabel!
    
    //displays the total after tip for the custom tip percentage selected
    @IBOutlet var customTotal: UILabel!
    
    //slider ranges from 0 to 50
    @IBOutlet var customTipSlider: UISlider!
    
    //Outlet to the textField to dismiss the keyboard
    @IBOutlet var textField: UITextField!
    
    //Sets the value from the textField to amount if there is any
    @IBAction func amountFieldEditingChanged(textField: UITextField){
        if let text = textField.text, value = Double(text){
            amount = value
        }
        else{
            amount = nil
        }
    }
    
    /*Sets the value from the slider to SliderPercent
        displays it to the custom tip percent label and tip percent label*/
    @IBAction func sliderValueChanged(slider:UISlider){
        sliderPercent = Int(slider.value)
        if let percent = sliderPercent{
            tipPercent.text = "\(percent)%"
            customTipPercent.text = "Custom Tip Percent: \(percent)%"
        }
    }
    
    //dismisses the keyboard when the background is tapped
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    /*updates the tip and total labels for the  15% tip
     if there is no amount set tip and total labels to nothing*/
    func update15Labels(){
        if let tip = tip15Percent, total = total15Percent{
            tip15.text = USCurrencyFormatter.stringFromNumber(tip)
            total15.text = USCurrencyFormatter.stringFromNumber(total)
        }
        else{
            tip15.text = ""
            total15.text = ""
        }

    }
    
    /*updates the tip and total labels for the custom tip percent
     if there is no amount set tip and total labels to nothing*/
    func updateCustomLabels(){
        if let tip = tipCustomPercent, total =  totalCustomPercent{
            customTip.text = USCurrencyFormatter.stringFromNumber(tip)
            customTotal.text = USCurrencyFormatter.stringFromNumber(total)
        }
        else{
            customTip.text = ""
            customTotal.text = ""
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        sliderPercent = 0
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
    
    


}

