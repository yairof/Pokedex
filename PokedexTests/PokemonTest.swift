//
//  PokemonTest.swift
//  PokedexTests
//
//  Created by Yairo Fernandez on 10/30/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_simple_init() {
        let bulb = Pokemon(name: "bulbasaur",
                           detailUrl: "https://pokeapi.co/api/v2/pokemon/1/")
        
        XCTAssertNotNil(bulb)
    }
    
    func test_numberFromURL() {
        let bulb = Pokemon(name: "bulbasaur",
                           detailUrl: "https://pokeapi.co/api/v2/pokemon/1/")
        
        XCTAssertEqual("1", bulb.numberFromURL())
        
        let char = Pokemon(name: "charizard",
                           detailUrl: "https://pokeapi.co/api/v2/pokemon/6/")
        
        XCTAssertEqual("6", char.numberFromURL())
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
