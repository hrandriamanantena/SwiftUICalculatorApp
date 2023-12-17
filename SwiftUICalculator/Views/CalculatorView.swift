//
//  CalculatorView.swift
//  SwiftUICalculator
//
//  Created by r.n. hermann on 14/08/2021.
//

import SwiftUI

let spacing: CGFloat = 1

enum CalculatorState {
    case editing
    case result
}

struct CalculatorView: View {
    @StateObject var viewModel = CalculatorViewModel()
    
    private let numberOfColumns = 4
    private let screenWidth = UIScreen.main.bounds.width
    
    func buttonWidth(forKey key: CalculatorKey) -> CGFloat {
        let width = (screenWidth - (spacing * .init(numberOfColumns - 1))) / .init(numberOfColumns)
        if case .number(0) = key {
            let colspan = 2
            return width * .init(colspan) + (spacing * .init(colspan - 1))
        }
        return width
    }
    
    var buttonHeight: CGFloat {
        return (screenWidth - 0) / 5
    }
    
    var body: some View {
        VStack(spacing: spacing) {
            Spacer()
            
            Text(viewModel.display)
                .font(.system(size: 80))
                .minimumScaleFactor(0.3)
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            ForEach(viewModel.keys, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { key in
                        CalculatorButton(key: key, width: buttonWidth(forKey: key), height: buttonHeight, action: { key in
                            viewModel.buttonTapped(button: key)
                        })
                    }
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
