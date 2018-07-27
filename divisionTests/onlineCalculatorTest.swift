//
//  onlineCalculatorTest.swift
//  divisionTests
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Yaheard, LLC. All rights reserved.
//

import XCTest

class onlineCalculatorTest: XCTestCase {
    
    let onlineCalcBrain = OnlineCalculatorBrain()
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRetreiveURLFor10DivideBy2() {
        let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalcBrain.retreiveURLForDivision(dividend: 10, devisor: 2)
        XCTAssert(url == response, "URL must be equals to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testRetreiveURLFor10DivideBy2ShouldFail() {
        let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalcBrain.retreiveURLForDivision(dividend: 20, devisor: 2)
        XCTAssert(url != response, "URL must not equal to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testCalculateDivisionONlineFor10DivideBy2ShouldBe5() {
        onlineCalcBrain.calculateWithTwoNumbers(dividend: 10, devisor: 2) { (response, error) in
            XCTAssert(response == 5, "Response should be 5")
        }
    }
    
    func testCalculateDivisionByZero() {
        let expectations = expectation(description: "Expected callback from API fail")
        
        onlineCalcBrain.calculateWithTwoNumbers(dividend: 10, devisor: 0) { (result, error) in
            if error==nil{
                XCTFail()
            } else {
                XCTAssert(error?.domain == "Division by Zero", "Response should be 'division by Zero'")
                expectations.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
