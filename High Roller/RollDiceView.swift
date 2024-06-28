//
//  RollDiceView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 28/6/24.
//

import SwiftUI

struct RollDiceView: View {
    
    var diceResults = DiceResults()
    
    @State var rolledValue1 = 0
    @State var rolledValue2 = 0
    @State var placeholder = 6
    
    var arrayNum = [6, 12, 15, 18, 20, 50, 100]

    var mensaje = "Choose how many sides you want:"
    
    var body: some View {
        VStack {
            
            DiceView()
                
            HStack {
                Text(mensaje)
                
                Picker("Choose a number", selection: $placeholder) {
                    ForEach(arrayNum, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            Button("Roll the dice", action: roll)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .buttonBorderShape(.automatic)
            
            
            Text("You got \(rolledValue1) and \(rolledValue2)")
            
            Text("Your total this round is: \(rolledValue1 + rolledValue2)")
            
        }
    }
    
    func roll() {
        rolledValue1 = Int.random(in: 1...placeholder)
        rolledValue2 = Int.random(in: 1...placeholder)
        
//        showScore()
        
        let diceResult = DiceResult(rolledValue1: rolledValue1, rolledValue2: rolledValue2, rolledValueSum: rolledValue1 + rolledValue2)
        
        diceResults.diceResults.append(diceResult)
        
        print(diceResults.diceResults.count)
    }
    
//    func showScore() {
//        let diceResult = DiceResult(rolledValue1: rolledValue1, rolledValue2: rolledValue2, rolledValueSum: rolledValue1 + rolledValue2)
//        
//        diceResults.diceResults.append(diceResult)
//    }
    
}

#Preview {
    RollDiceView()
}
