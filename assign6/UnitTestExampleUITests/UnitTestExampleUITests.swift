//
//  UnitTestExampleUITests.swift
//  UnitTestExampleUITests
//
//  Created by Deanna Yee on 11/12/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import XCTest

class UnitTestExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testButtonDoubles(){
        
        let app = XCUIApplication()
        let enterNumberTextField = app.textFields["Enter Number"]
        enterNumberTextField.tap()
        enterNumberTextField.typeText("2")
        app.buttons["x2"].tap()
        guard let text:String = enterNumberTextField.value as! String
            else{
                XCTFail()
                return
        }
        guard let numberFromField = Int(text) else {
            XCTFail()
            return
        }
        XCTAssertEqual(numberFromField, 4)
        //Leave the text insetion caret inside this method
    }
    
}
