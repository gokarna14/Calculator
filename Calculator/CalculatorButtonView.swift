//
//  ContentView.swift
//  Calculator
//
//  Created by Prabas Adhikari on 12/04/2023.
//
import SwiftUI

struct CalculatorButtonView: View {
    var button: CalculatorButton
    @EnvironmentObject var viewModel: CalculatorViewModel

    var body: some View {
        Button(action: { viewModel.buttonPressed(button) }) {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: self.buttonWidth(), height: self.buttonHeight())
                .foregroundColor(.white)
                .background(self.buttonColor())
                .cornerRadius(self.buttonWidth() / 2)
        }
    }

    private func buttonWidth() -> CGFloat {
        return button == .zero ? (UIScreen.main.bounds.width - 5 * 12) / 2 : (UIScreen.main.bounds.width - 5 * 12) / 4
    }

    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }

    private func buttonColor() -> Color {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.black)
        case .clear, .negative, .percent:
            return Color(.red)
        default:
            return Color(.brown)
        }
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(button: .one)
            .environmentObject(CalculatorViewModel())
            .previewLayout(.sizeThatFits)
    }
}
