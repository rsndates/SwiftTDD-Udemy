//
//  ViewController.swift
//  division
//
//  Created by Robert Dates on 7/26/18.
//  Copyright © 2018 Robert Dates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    public let calculatorBrain = CalculatorBrain()
    @IBAction func calculateButton(_ sender: Any) {
        guard div1Textfield.text != nil && div2Textfield.text != nil else { return }
        guard let div1 = Int(div1Textfield.text!), let div2 = Int(div2Textfield.text!) else { return }
        
        calculatorBrain.divideTwoNumbers(dividend: div1, devisor: div2) { (result, error) in
            guard error == nil else { return }
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            guard let result = result else { return }
            self.resultLabel.text = numberFormatter.string(from: NSNumber(floatLiteral: Double(result)))
        }
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var div2Textfield: UITextField!
    @IBOutlet weak var div1Textfield: UITextField!
    
    //MARK: Methods and Responders
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

