//
//  PokemonTests.swift
//  iOSUnitTestsIntro
//
//  Created by Deanna Yee on 11/12/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import XCTest
@testable import iOSUnitTestsIntro

class PokemonTests: XCTestCase {
    
    var squirtle:Pokemon!
    var charmander:Pokemon!
    var psyduck:Pokemon!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        squirtle = Pokemon(type: .Water, attackType: .Water)
        charmander = Pokemon(type: .Fire, attackType: .Fire)
        psyduck = Pokemon(type: .Water, attackType: .Water)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        squirtle = nil
        charmander = nil
        psyduck = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testThatAWaterPokemonDoesMoreDamageToAFirePokemon(){
        // 1. Have Squirtle Attack Charmander
        squirtle.attack(enemy: charmander)
        
        //Ouch!
        // 2. Now Have Squirtle Attack Psyduck
        squirtle.attack(enemy: psyduck)
        
        //Oooh. That has to hurt.
        
        //Who took more damage? Charmander or Psyduck?
        
        //If a Water Pokemon Does More Damage To A Fire Pokemon,
        //We would expect Charmander to have less health than Psyduck.
        
        // 3. Test it
        XCTAssertTrue(charmander.health < psyduck.health)
    }
        
}
