//
//  OnlineCaculatorBrain.swift
//  division
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Yaheard, LLC. All rights reserved.
//

import UIKit

class OnlineCalculatorBrain: NSObject {

    
    func retreiveURLForDivision(dividend: Int, devisor: Int) -> NSURL {
        return NSURL(string: "https://www.calcatraz.com/calculator/api?c=\(dividend)%2F\(devisor)")!
    }
    
    func calculateWithTwoNumbers(dividend: Int, devisor: Int, completionHandler: @escaping ((Float?, NSError?) ->())) {
        let url = retreiveURLForDivision(dividend: dividend, devisor: devisor)
        let session = URLSession.shared
        let task = session.dataTask(with: url as! URL) { (data:Data?, response:URLResponse?, error:Error?) -> Void in
            if error == nil {
                if let data = data {
                    
                    let sValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    var fValue = sValue?.floatValue
                    if fValue == nil || sValue!.length > 10 {
                        let error = NSError(domain: "Division by Zero", code: 1, userInfo: nil)
                        return completionHandler(nil, error)
                    }
                    return completionHandler(sValue?.floatValue, nil)
                }
                let localError = NSError(domain: "No data was found", code: 1, userInfo: nil)
                return completionHandler(nil, localError)
                }else {
                    print(error?.localizedDescription)
                return completionHandler(nil, error as! NSError)
                }
            }
        task.resume()
    }
}
