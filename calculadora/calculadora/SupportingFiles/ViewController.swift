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
    
    var number: Double = 0
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    var isResult = false
    
    lazy var calculator = Calculator()
    
    var selectedAction: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet var numbersButtons: [UIButton]!
    
    @IBAction func onClickNumber(_ sender: UIButton) {
        let buttonLabel = sender.titleLabel?.text ?? ""
        
        var currentNumberLabel = "\(numberLabel.text != "0" ? numberLabel.text ?? "" : "")\(buttonLabel)"
        
        if isResult {
           currentNumberLabel = "\(buttonLabel)"
        }
        
        numberLabel.text = currentNumberLabel
        
        number = Double(currentNumberLabel) ?? 0
    }
    
    
    @IBAction func actionsButtons(_ sender: UIButton) {
        let actionLabel = sender.titleLabel?.text ?? ""
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
                    result = 0
                    break
            }
            
        } else if actionLabel == CalculatorActions.elevated.rawValue {
            result = calculator.elevate(number: number)
        } else if actionLabel == CalculatorActions.square.rawValue {
            result = calculator.square(number: number)
        } else {
            firstNumber = number
            selectedAction = actionLabel
        }
        
        number = result
        isResult = true
        
        if result != 0 {
            resultLabel.text = "\(result)"
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        number = 0
        firstNumber = 0
        secondNumber = 0
        numberLabel.text = "0"
        resultLabel.text = "0"
    }
}

