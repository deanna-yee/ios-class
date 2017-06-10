//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by Deanna Yee on 11/12/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import XCTest
@testable import UnitTestExample


class UnitTestExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
        
    /*func testVariousAssertions(){
        XCTAssertTrue(1 < 2, "left side is not less than right side")
        XCTAssertTrue(5 < 2, "left side is not less than right side")
        
        XCTAssertFalse(3 < 2, "left side is less than right side")
        XCTAssertFalse(3 < 7, "left side is less than right side")
        
        XCTAssertEqual(1, 1, "Numbers aren't the same")
        XCTAssertEqual(1, 2, "Numbers aren't the same")
        
        XCTAssertNotEqual(5, 4, "Numbers are the same")
        XCTAssertNotEqual(5, 5, "Numbers are the same")
        
        XCTAssertNil(nil, "Object is not nil")
        XCTAssertNil("Hello", "Object is not nil")
        
        XCTAssertNotNil("Hello", "Object is nil")
        XCTAssertNotNil(nil, "Object is nil")
    }*/
    
    func testCalculatorEngineDouble(){
        let engine = CalculatorEngine()
        let number = 5
        let expectedResult = 10
        let result = engine.doubleNumber(number: number)
        XCTAssertEqual(result, expectedResult, "Number was not doubled correctly")
    }
    
    func testDoublePerformance(){
        let engine = CalculatorEngine()
        measure { () -> Void in
            var num = 9
            for index in 1...2000{
                num += engine.doubleNumber(number: index)
            }
            
        }
    }
    
}
