//
//  Calculator.swift
//  calculadora
//
//  Created by Luan Winck on 28/05/19.
//  Copyright © 2019 CWI software. All rights reserved.
//

import Foundation

class Calculator {
    func sumNumbers(first firstNumber: Double, second secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
    
    func subtractNumbers(first firstNumber: Double, second secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
    
    func multiplyNumbers(first firstNumber: Double, second secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
    
    func divideNumbers(first firstNumber: Double, second secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
    
    func square(number: Double) -> Double {
        return pow(number, 2)
    }
    
    func elevate(number: Double) -> Double {
        return sqrt(number)
    }
}

enum CalculatorActions: String {
    case subtract = "-"
    case sum = "+"
    case multiply = "X"
    case divide = "/"
    case elevated = "ˆ2"
    case square = "√"
    case equal = "="
}
