//
//  ContentView.swift
//  Calculator
//
//  Created by Prabas Adhikari on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                VStack{
                    Divider()
                        .background(Color.blue)
                        .frame(height: 2)
                    Text("Welcome to Fancy Calculator")
                        .padding()
                        .font(.title)
                        .italic()
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .padding(.horizontal)
                }
                Spacer()
                HStack {
                    Spacer()
                    Text(viewModel.display)
                        .font(.system(size: 64))
//                        .foregroundColor()
                }.padding()

                VStack(spacing: 12) {
                    HStack(spacing: 12
                    ) {
                    CalculatorButtonView(button: .clear).environmentObject(viewModel)
                    CalculatorButtonView(button: .negative).environmentObject(viewModel)
                    CalculatorButtonView(button: .percent).environmentObject(viewModel)
                    CalculatorButtonView(button: .divide).environmentObject(viewModel)
                    }
                    HStack(spacing: 12) {
                        CalculatorButtonView(button: .seven).environmentObject(viewModel)
                        CalculatorButtonView(button: .eight).environmentObject(viewModel)
                        CalculatorButtonView(button: .nine).environmentObject(viewModel)
                        CalculatorButtonView(button: .multiply).environmentObject(viewModel)
                    }

                    HStack(spacing: 12) {
                        CalculatorButtonView(button: .four).environmentObject(viewModel)
                        CalculatorButtonView(button: .five).environmentObject(viewModel)
                        CalculatorButtonView(button: .six).environmentObject(viewModel)
                        CalculatorButtonView(button: .minus).environmentObject(viewModel)
                    }

                    HStack(spacing: 12) {
                        CalculatorButtonView(button: .one).environmentObject(viewModel)
                        CalculatorButtonView(button: .two).environmentObject(viewModel)
                        CalculatorButtonView(button: .three).environmentObject(viewModel)
                        CalculatorButtonView(button: .plus).environmentObject(viewModel)
                    }

                    HStack(spacing: 12) {
                        CalculatorButtonView(button: .zero).environmentObject(viewModel)
                        CalculatorButtonView(button: .decimal).environmentObject(viewModel)
                        CalculatorButtonView(button: .equal).environmentObject(viewModel)
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ContentView()
}
}

