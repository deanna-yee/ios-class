//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Deanna Yee on 11/12/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberDisplay: UITextField!
    
    let engine = CalculatorEngine()
    
    @IBAction func multiplyByTwo(_ sender: AnyObject) {
        guard let text = numberDisplay.text else {return}
        guard let number = Int(text) else {return}
        numberDisplay.text = String(engine.doubleNumber(number: number))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

