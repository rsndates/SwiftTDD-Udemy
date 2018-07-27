//
//  CalculatorBrain.swift
//  division
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Yaheard, LLC. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {
    
    func divideTwoNumbers(dividend: Int, devisor: Int, completion: ((_ result:Float?, _ error:NSError?) -> Void)) {
        Thread.sleep(forTimeInterval: 1)
        guard devisor != 0 else {
            let error = NSError(domain: "Error dividing by zero", code: 1, userInfo: nil)
            return completion(nil, error)
        }
        return completion(Float(dividend/devisor), nil)
    }
}
