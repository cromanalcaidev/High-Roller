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
            NavigationStack {
                ScrollView {
                    VStack {
                        ForEach(diceResults.diceResults, id: \.self) { result in
                            if result.twoDice == false {
                                
                                Button("press me") {
                                    print(result.twoDice)
                                }
                                
                                ZStack {
                                    CardResultView(border: result.didIWin == true ? .green : .red)
                                        .frame(minHeight: 110)
                                    
                                    HStack {
                                        VStack {
                                            Text("Dice rolled: 1")
                                                .frame (maxWidth: 100, alignment: .leading)
                                            
                                            Text("Result: \(result.rolledValue1)")
                                                .frame(maxWidth: 100, alignment: .leading)
                                        }
                                        
                                        Text(result.didIWin == true ? "You won this round!" : "You lost this round")
                                            .frame(maxWidth: 140, alignment: .trailing)
                                    }
                                }
                                .frame(maxHeight: 130, alignment: .center)
                            } else if result.twoDice == true {
                                
                                Button("press me") {
                                    print(result.twoDice)
                                }
                                
                                ZStack {
                                    CardResultView(border: result.didIWin == true ? .green : .red)
                                        .frame(minHeight: 110)
                                    
                                    HStack {
                                        VStack {
                                            Text("Dice rolled: 2")
                                                .frame (maxWidth: 100, alignment: .leading)
                                            
                                            Text("Result: \(result.rolledValueSum)")
                                                .frame(maxWidth: 100, alignment: .leading)
                                        }
                                        
                                        Text(result.didIWin == true ? "You won this round!" : "You lost this round")
                                            .frame(maxWidth: 140, alignment: .trailing)
                                    }
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Restart results") {
                            diceResults.diceResults = []
                        }
                    }
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
