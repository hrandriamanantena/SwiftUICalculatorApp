//
//  CalculatorButton.swift
//  SwiftUICalculator
//
//  Created by r.n. hermann on 14/08/2021.
//

import SwiftUI

struct CalculatorButton: View {
    let key: CalculatorKey
    var width: CGFloat
    var height: CGFloat
    let action: (CalculatorKey) -> Void
    
    var body: some View {
        Button(action: {
            action(key)
        }) {
            Text(key.text)
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: width, height: height)
                .background(key.color)
                .cornerRadius(0)
        }
    }
}
