//
//  ContentView.swift
//  Calculator
//
//  Created by Prabas Adhikari on 12/04/2023.
//
import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case decimal
    case equal, plus, minus, multiply, divide
    case clear, negative, percent

    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .decimal: return "."
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "÷"
        case .clear: return "AC"
        case .negative: return "+/-"
        case .percent: return "%"
        }
    }
}
