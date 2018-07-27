//
//  divisionTests.swift
//  divisionTests
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Robert Dates. All rights reserved.
//

import XCTest
@testable import division

class divisionTests: XCTestCase {
    
    private let calculatorBrain = CalculatorBrain()
    override func setUp() {
        super.setUp()
    
    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func test10DivideBy5MustBe2() {
        calculatorBrain.divideTwoNumbers(dividend: 10, devisor:5) { (result,error) -> Void in
            XCTAssert(result == 2, "Result must be 2")
        }
    }
    
    private func test10DivideBy0MustBeNil() {
        calculatorBrain.divideTwoNumbers(dividend: 10, devisor:0) { (result,error) -> Void in
            XCTAssertNil(result, "Result must be nil")
            XCTAssert(error?.domain == "Error dividing by zero", "Error message should be 'Error dividing by zero'")
        }
    }
    
    private func testTestDivisionTime() {
        measure {
            self.calculatorBrain.divideTwoNumbers(dividend: 10, devisor: 2, completion: { (result, error) in
                
            })
        }
    }
    
}
