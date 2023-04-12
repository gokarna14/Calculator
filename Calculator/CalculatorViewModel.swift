//
//  ContentView.swift
//  Calculator
//
//  Created by Prabas Adhikari on 12/04/2023.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    
    private var currentNumber: Double = 0
    private var storedNumber: Double?
    private var currentOperation: CalculatorButton?
    
    func buttonPressed(_ button: CalculatorButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            currentNumber = currentNumber * 10 + Double(button.title)!
            display = String(format: "%g", currentNumber)
        case .decimal:
            if !display.contains(".") {
                display = display + "."
                currentNumber = Double(display) ?? currentNumber
            }
        case .clear:
            currentNumber = 0
            storedNumber = nil
            currentOperation = nil
            display = "0"
        case .negative:
            currentNumber = -currentNumber
            display = String(format: "%g", currentNumber)
        case .percent:
            currentNumber = currentNumber / 100
            display = String(format: "%g", currentNumber)
        case .plus, .minus, .multiply, .divide:
            if storedNumber == nil {
                storedNumber = currentNumber
            } else if let storedNumber = storedNumber, let operation = currentOperation {
                let result = performOperation(a: storedNumber, b: currentNumber, operation: operation)
                currentNumber = result
                display = String(format: "%g", result)
                self.storedNumber = nil
            }
            currentOperation = button
            currentNumber = 0
        case .equal:
            if let storedNumber = storedNumber, let operation = currentOperation {
                let result = performOperation(a: storedNumber, b: currentNumber, operation: operation)
                currentNumber = result
                display = String(format: "%g", result)
                self.storedNumber = nil
                self.currentOperation = nil
            }
        }
    }
    
    private func performOperation(a: Double, b: Double, operation: CalculatorButton) -> Double {
        switch operation {
        case .plus:
            return a + b
        case .minus:
            return a - b
        case .multiply:
            return a * b
        case .divide:
            return a / b
        default:
            return b
        }
    }
}
