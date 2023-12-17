//
//  CalculatorViewModel.swift
//  SwiftUICalculator
//
//  Created by r.n. hermann on 14/08/2021.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    @Published private(set) var keys: [[CalculatorKey]] = [
        [.clear(true), .plusMinus, .percent, .divide],
        [.number(7), .number(8), .number(9), .times],
        [.number(4), .number(5), .number(6), .minus],
        [.number(1), .number(2), .number(3), .plus],
        [.number(0), .point, .equals]
    ]
    
    private var currentOperandRank: OperandRank?
    private var firstOperand: Double?
    private var secondOperand: Double?
    private var currentOperation: CalculatorKey?
    
    private var shouldAppendDisplay = true
    
    func buttonTapped(button: CalculatorKey) {
        switch button {
        case .number:
            if display == "0" || !shouldAppendDisplay {
                display = button.text
                shouldAppendDisplay = true
            } else {
                display += button.text
            }
            
            if currentOperation == nil {
                firstOperand = Double(display)
            } else {
                secondOperand = Double(display)
            }
            
            keys[0][0] = .clear(false) // C
            
        case .plus, .minus, .times, .divide:
            shouldAppendDisplay = false
            currentOperation = button
            secondOperand = Double(display)
            
        case .equals:
            if let operation = currentOperation, let firstOperand = firstOperand {
                var newNumber: Double = 0
                switch operation {
                case .plus:
                    newNumber = firstOperand + (secondOperand ?? firstOperand)
                case .minus:
                    newNumber = firstOperand - (secondOperand ?? firstOperand)
                case .times:
                    newNumber = firstOperand * (secondOperand ?? firstOperand)
                case .divide:
                    newNumber = firstOperand / (secondOperand ?? firstOperand)
                default:
                    break
                }
                
                self.display = formatNumber(newNumber)
                self.firstOperand = newNumber
                self.currentOperation = operation
                self.shouldAppendDisplay = true
            }
            
        case .clear(let all):
            display = "0"
            
            if (!all) {
                keys[0][0] = .clear(true) // AC
            } else {
                firstOperand = nil
                currentOperation = nil
                secondOperand = nil
                shouldAppendDisplay = true
            }
            
        case .point:
            if !display.contains(".") {
                display += "."
            }
            
        case .plusMinus:
            if let number = Double(display) {
                display = formatNumber(-number)
            }
            
        case .percent:
            if let number = Double(display) {
                display = formatNumber(number / .init(100))
            }
        }
    }
    
    private func formatNumber(_ number: Double?) -> String {
        guard let number = number else { return "ERROR" }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 15
        formatter.minimumFractionDigits = 0
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}

extension CalculatorViewModel {
    enum OperandRank {
        case first
        case second
    }
}
