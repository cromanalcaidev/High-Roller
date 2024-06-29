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
    var guessYourResult = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    @State private var selected = "I'll get more than"
    @State private var initialBet = 1.0
    @State private var userCredit = 2.0

    var message = "Choose how many sides you want:"
    
    @State private var oneToRoll = true
    @State private var diceNumberMessage = "Gimme two"
    
    @State private var diceSide = DiceSide.four
    @State private var secondDiceSide = DiceSide.three
    
    @State private var iWon = false
    @State private var iLost = false
    
    var body: some View {
        VStack {
            
            Section() {
                if initialBet > 0 {
                    Text("Your credit is: \(userCredit.formatted())")
                        .font(.headline)
                }
            }
            .frame(width: 300, height: 50, alignment: .topTrailing)
            
            Section() {
                Text("How many dice you wanna roll?")
                    .font(.headline)
                
                Button() {
                    addDice()
                } label: {
                    Text("\(diceNumberMessage)")
                        .frame(width: 100)
                }
                .controlSize(.regular)
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .buttonBorderShape(.automatic)
            }
            
            if oneToRoll {
                DiceView(diceSide: $diceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                    .frame(maxWidth: 290, maxHeight: 170, alignment: .center)
            } else {
                HStack {
                    DiceView(diceSide: $diceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                    
                    Spacer()
                    
                    DiceView(diceSide: $secondDiceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                }
                .frame(maxWidth: 290, maxHeight: 170, alignment: .center)
            }
            
            Section() {
                Text("Wanna make the game a little spicy?")
                    .padding(.top, 10)
                
                HStack {
                    Text("Place your bet:")
                    
                    TextField("0", value: $initialBet, format: .number)
                        .frame(width: 20)
                }
                .frame(width: 290, alignment: .center)
                
                if initialBet > 0 {
                    BettingView(selected: $selected)
                }
            }
            .frame(width: 300)
            
            VStack {
                Button("Roll dice", action: roll)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.regular)
                    .buttonBorderShape(.automatic)
                
                
                Text(diceNumberMessage == "Gimme two" ? "You got \(rolledValue1)" : "You got \(rolledValue1) and \(rolledValue2)")
                
                if diceNumberMessage == "Just one" { Text("Your total this round is: \(rolledValue1 + rolledValue2)")
                }
            }
            .frame(height: 200)
        }
        .alert("You won!", isPresented: $iWon) {
            Button("Great", role: .cancel) {
                //
            }
        }
        .alert("You lost!", isPresented: $iLost) {
            Button("Sorry!", role: .cancel) {
                //
            }
        }
    }
    
    func roll() {
        rolledValue1 = Int.random(in: 1...placeholder)
        rolledValue2 = Int.random(in: 1...placeholder)
        
        areWeBettingNowDave()
        uploadDiceDots()
        
        uploadResult()
    }
    
    func areWeBettingNowDave() {
        if initialBet > 0 {
            if diceNumberMessage == "Just one" {
                if selected == "I'll get more than" {
                    if rolledValue1 + rolledValue2 > placeholder {
                        userCredit += (initialBet * 1.2)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 1.2)
                        iLost = true
                    }
                } else if selected == "I'll get less than" {
                    if rolledValue1 + rolledValue2 < placeholder {
                        userCredit += (initialBet * 1.2)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 1.2)
                        iLost = true
                    }
                } else if selected == "I'll get exactly" {
                    if rolledValue1 + rolledValue2 == placeholder {
                        userCredit += (initialBet * 2.4)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 2.4)
                        iLost = true
                    }
                }
            } else if diceNumberMessage == "Gimme two" {
                if selected == "I'll get more than" {
                    if rolledValue1 > placeholder {
                        userCredit += (initialBet * 0.6)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 0.6)
                        iLost = true
                    }
                } else if selected == "I'll get less than" {
                    if rolledValue1 < placeholder {
                        userCredit += (initialBet * 0.6)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 0.6)
                        iLost = true
                    }
                } else if selected == "I'll get exactly" {
                    if rolledValue1 == placeholder {
                        userCredit += (initialBet * 1.2)
                        iWon = true
                    } else {
                        userCredit -= (initialBet * 1.2)
                        iLost = true
                    }
                }
            }
        }
    }
    
    func uploadDiceDots() {
        switch rolledValue1 {
        case 1:
            diceSide = .one
        case 2:
            diceSide = .two
        case 3:
            diceSide = .three
        case 4:
            diceSide = .four
        case 5:
            diceSide = .five
        case 6:
            diceSide = .six
        default:
            diceSide = .four
        }
        
        switch rolledValue2 {
        case 1:
            secondDiceSide = .one
        case 2:
            secondDiceSide = .two
        case 3:
            secondDiceSide = .three
        case 4:
            secondDiceSide = .four
        case 5:
            secondDiceSide = .five
        case 6:
            secondDiceSide = .six
        default:
            secondDiceSide = .three
        }
    }
    
    func uploadResult() {
        let diceResult = DiceResult(rolledValue1: rolledValue1, rolledValue2: rolledValue2, rolledValueSum: rolledValue1 + rolledValue2)
        
        diceResults.diceResults.append(diceResult)
    }
    
    func addDice() {
        oneToRoll.toggle()
        
        if oneToRoll == true {
            diceNumberMessage = "Gimme two"
        } else {
            diceNumberMessage = "Just one"
        }
        
        
    }
    
}

#Preview {
    RollDiceView()
}
