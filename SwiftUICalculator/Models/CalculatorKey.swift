//
//  CalculatorKey.swift
//  SwiftUICalculator
//
//  Created by r.n. hermann on 14/08/2021.
//

import SwiftUI

enum CalculatorKey: Hashable {
    case clear(Bool)
    case plusMinus
    case percent
    case divide
    case times
    case minus
    case plus
    case equals
    case point
    case number(Int)
    
    var text: String {
        switch self {
        case .clear(let all): return all ? "AC" : "C"
        case .divide: return "÷"
        case .times: return "×"
        case .minus: return "−"
        case .plus: return "+"
        case .equals: return "="
        case .point: return "."
        case .percent: return "%"
        case .plusMinus: return "⁺∕₋"
        case .number(let value): return value.description
        }
    }
    
    var color: Color {
        switch self {
        case .clear, .plusMinus, .percent:
            return Color(.darkGray)
        case .divide, .times, .minus, .plus, .equals:
            return Color(.orange)
        default:
            return Color(.gray)
        }
    }
}
