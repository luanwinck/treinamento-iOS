//
//  ViewController.swift
//  calculadora
//
//  Created by Luan Winck on 28/05/19.
//  Copyright © 2019 CWI software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var number: Double = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    lazy var calculator = Calculator()
    
    var selectedAction: String = ""
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet var numbersButtons: [UIButton]!
    
    @IBAction func onClickNumber(_ sender: UIButton) {
        let numberLabel = sender.titleLabel?.text ?? ""
        let concatedLabel = number > 0 ? "\(number)\(numberLabel)" : numberLabel
        
        number = Double(concatedLabel) ?? 0
    }
    
    
    @IBAction func actionsButtons(_ sender: UIButton) {
        let actionLabel = sender.titleLabel?.text ?? ""
        print(actionLabel)
        
        var result: Double = 0
        
        if actionLabel == CalculatorActions.equal.rawValue {
            
            switch selectedAction {
                case CalculatorActions.sum.rawValue:
                    result = calculator.sumNumbers(first: firstNumber, second: number)
                    break
                case CalculatorActions.subtract.rawValue:
                    result = calculator.subtractNumbers(first: firstNumber, second: number)
                    break
                case CalculatorActions.multiply.rawValue:
                    result = calculator.multiplyNumbers(first: firstNumber, second: number)
                    break
                case CalculatorActions.divide.rawValue:
                    result = calculator.divideNumbers(first: firstNumber, second: number)
                    break
                default:
                    print("default")
            }
            
        } else if actionLabel == CalculatorActions.elevated.rawValue {
            result = calculator.elevate(number: firstNumber)
        } else if actionLabel == CalculatorActions.square.rawValue {
            result = calculator.square(number: firstNumber)
        } else {
            firstNumber = number
            number = 0
            selectedAction = actionLabel
        }
        
        number = result
    }
    
    @IBAction func clear(_ sender: Any) {
        number = 0
        firstNumber = 0
        secondNumber = 0
    }
}

