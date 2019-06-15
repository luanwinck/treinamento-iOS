//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Luan Winck on 15/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest

class PokedexUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITests"]
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEx() {
        let cells = app.descendants(matching: .cell)
        let firstCell = cells.firstMatch
        firstCell.tap()
        
        XCTAssertTrue(app.otherElements["detailView"].waitForExistence(timeout: 1))
    }

    func testExample() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Bulbasaur"]/*[[".cells.staticTexts[\"Bulbasaur\"]",".staticTexts[\"Bulbasaur\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["▼"].tap()
    }

}
