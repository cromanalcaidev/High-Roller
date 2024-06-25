//
//  DiceView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 25/6/24.
//

import SwiftUI

struct DiceView: View {
    @State private var rolledValue1 = 0
    @State private var rolledValue2 = 0
    @State private var chooseValue = 0
    var mensaje = "Elige número de caras"
    
    var body: some View {
        
        VStack {
            Text(mensaje)
            
            TextField("\(mensaje)", value: $chooseValue, format: .number)
                .padding(.horizontal, 190)
            
            Text("You got \(rolledValue1) and \(rolledValue2)")
            Button("Roll the dice", action: roll)
        }
    }
    
    func roll() {
        rolledValue1 = Int.random(in: 1...chooseValue)
        rolledValue2 = Int.random(in: 1...chooseValue)
    }
}

#Preview {
    DiceView()
}
