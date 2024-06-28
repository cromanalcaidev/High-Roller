//
//  ResultsView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 28/6/24.
//

import SwiftUI

struct ResultsView: View {
    
    var diceResults = DiceResults()
    
    var body: some View {        
        if diceResults.diceResults.isEmpty == false {
            List {
                ForEach(diceResults.diceResults, id: \.self) { result in
                    Text("\(result.rolledValue1) & \(result.rolledValue2)")
                }
            }
        } else {
            Text("U haven't rolled your dice yet, mate")
                .font(.title)
        }
    }
}

#Preview {
    ResultsView()
}
