import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"

    func buttonPressed(_ button: CalculatorButton) {
        // Handle the button press actions and update the display
    }
}
