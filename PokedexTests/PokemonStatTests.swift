//
//  PokemonStatTests.swift
//  PokedexTests
//
//  Created by Jared Egan on 10/30/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import XCTest
@testable import Pokedex

class PokemonStatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_display_string() {
        let sampleStat = PokemonStat(baseStat: 52, effort: 0, name: "speed")
        let sampleStat2 = PokemonStat(baseStat: 25, effort: 0, name: "defense")

        XCTAssertEqual(sampleStat.displayString, "Speed (Base value: 52)")
        XCTAssertEqual(sampleStat2.displayString, "Defense (Base value: 25)")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
