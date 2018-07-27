//
//  ViewController.swift
//  division
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Yaheard, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculatorBrain = CalculatorBrain()
    let calculOnline = OnlineCalculatorBrain()
    @IBAction func calculateButton(_ sender: Any) {
        if div1Textfield.text != nil && div2Textfield.text != nil {
            if let div1 = Int(div1Textfield.text!){
                if let div2 = Int(div2Textfield.text!){
                    calculatorBrain.divideTwoNumbers(dividend: div1, devisor: div2) { (result, error) in
                        if error == nil {
                            let numberFormatter = NumberFormatter()
                            
                            numberFormatter.numberStyle = .decimal
                            if let result = result {
                                self.resultLabel.text = numberFormatter.string(from: NSNumber(floatLiteral: Double(result)))
                            }
                        }
                    }
                }
            }
        }
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var div2Textfield: UITextField!
    @IBOutlet weak var div1Textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

