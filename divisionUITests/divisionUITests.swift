//
//  divisionUITests.swift
//  divisionUITests
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Yaheard, LLC. All rights reserved.
//

import XCTest

class divisionUITests: XCTestCase {
    var app = XCUIApplication()
    var device = XCUIDevice()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMainScreen(){
        let labelText = app.staticTexts["Enter two numbers"]
        XCTAssertTrue(labelText.exists, "Should be in the main screen")
    }
    
    func testCalculate10DivideBy2LabelResult(){
        let div1 = app.textFields.element(boundBy: 0)
        let div2 = app.textFields.element(boundBy: 1)
        div1.tap()
        div1.typeText("10")
        div2.tap()
        div2.typeText("2")
        app.buttons["Calculate"].tap()
        
        XCTAssertTrue(app.staticTexts["5"].exists, "Result should be displaying '5'")
    }
    
    func testCalculate20DivideBy10LabelResult() {
        
        let element = app.otherElements.containing(.staticText, identifier:"Enter two numbers").children(matching: .other).element.children(matching: .other).element
        element.children(matching: .textField).element(boundBy: 0).tap()
        
        let app2 = app
        let moreKey = app2/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        
        moreKey.tap()
        
        let key = app2/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        let key2 = app2/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        
        let textField = element.children(matching: .textField).element(boundBy: 1)
        textField.tap()
        
        
        moreKey.tap()
        
        let key3 = app2/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        key3.tap()
       
        key2.tap()
        app.buttons["Calculate"].tap()
        
        
       
        XCTAssertTrue(app.staticTexts["2"].exists, "Result should be displaying '2'")
        
        
    }
}
