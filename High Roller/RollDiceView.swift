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
    
    @State var defaultGuessValue = 3
    var guessYourResult = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    @State private var selected = "I'll get more than"
    @State private var initialBet = 0.0
    @State private var userCredit = 2.0

    var message = "Choose how many sides you want:"
    
    @State private var oneToRoll = true
    @State private var diceNumberMessage = "Gimme two"
    
    @State private var diceSide = DiceSide.four
    @State private var secondDiceSide = DiceSide.three
    
    @State private var iWon = false
    @State private var iLost = false
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    @State private var activateTimer = false
    
    var body: some View {
        VStack {
            
            Section() {
                if initialBet >= 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.green)
                            .frame(maxWidth: 170, maxHeight: 60)
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.white)
                            .frame(maxWidth: 163, maxHeight: 55)
                        
                        Text("Your credit is: \(userCredit.formatted())")
                            .font(.headline)
                    }
                    .frame(maxWidth: 170)
                }
            }
            .frame(maxWidth: 300, maxHeight: 70)

            
            if oneToRoll {
                DiceView(diceSide: $diceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                    .frame(maxWidth: 290, maxHeight: 130, alignment: .center)
//                    .onReceive(timer) { _ in
//                        if activateTimer == true {
//                            for singleCase in DiceSide.allCases {
//                            }
//                        }
//                    }
            } else {
                HStack {
                    DiceView(diceSide: $diceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                    
                    Spacer()
                    
                    DiceView(diceSide: $secondDiceSide, rolledValue1: $rolledValue1, rolledValue2: $rolledValue2)
                }
                .frame(maxWidth: 290, maxHeight: 130, alignment: .center)
            }
            
            Section {
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.indigo)
                        .frame(maxWidth: 330, maxHeight: 110)
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .frame(maxWidth: 323, maxHeight: 105, alignment: .center)
                    
                    VStack {
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
                }
            }
            .frame(maxHeight: 120)
            
            Section() {
                ZStack {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.red)
                        .frame(maxWidth: 330, maxHeight: 110, alignment: .center)
                    
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(.white)
                        .frame(maxWidth: 323, maxHeight: 105)
                    VStack {
                        Text("Wanna make the game a little spicy?")
                            .font(.headline)
                        
                        HStack {
                            Text("Place your bet:")
                            
                            Stepper("\(initialBet, specifier: "%.1f")", onIncrement: {
                                initialBet += 0.1
                            }, onDecrement: {
                                if initialBet >= 0.1 {
                                    initialBet -= 0.1
                                }
                            })
                        }
                        .frame(maxWidth: 280)
                    }
                }
                .frame(maxHeight: 120)
            }
            

            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.orange)
                    .frame(maxWidth: 330, maxHeight: 90)
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
                    .frame(maxWidth: 323, maxHeight: 85)
                
                VStack {
                    
                    BettingView(defaultGuessValue: $defaultGuessValue, oneToRoll: $oneToRoll, selected: $selected)
                }
                .frame(maxHeight: 100, alignment: .center)
            }

            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.yellow)
                    .frame(maxWidth: 330, maxHeight: 100)
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
                    .frame(maxWidth: 323, maxHeight: 95)
                
                VStack {
                    Button("Roll the dice", action: roll)
                        .buttonStyle(.borderedProminent)
                        .controlSize(.regular)
                        .buttonBorderShape(.automatic)
                    
                    Text(diceNumberMessage == "Gimme two" ? "You got \(rolledValue1) this turn" : "You got \(rolledValue1 + rolledValue2) this turn")
                        .font(.headline)
                        .frame(maxWidth: 290)
                }
                .frame(maxHeight: 110, alignment: .center)
            }
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
        
//        activateTimer.toggle()
        
        rolledValue1 = Int.random(in: 1...6)
        rolledValue2 = diceNumberMessage == "Gimme two" ? 0 : Int.random(in: 1...6)
        
        
        
        areWeBettingNowDave()
        uploadDiceDots()
        
        uploadResult()
    }
    
    func areWeBettingNowDave() {
        if diceNumberMessage == "Just one" {
            if selected == "I'll get more than" {
                if rolledValue1 + rolledValue2 > defaultGuessValue {
                    userCredit += (initialBet * 1.2)
                    iWon = true
                } else {
                    userCredit -= (initialBet * 1.2)
                    iLost = true
                }
            } else if selected == "I'll get less than" {
                if rolledValue1 + rolledValue2 < defaultGuessValue {
                    userCredit += (initialBet * 1.2)
                    iWon = true
                } else {
                    userCredit -= (initialBet * 1.2)
                    iLost = true
                }
            } else if selected == "I'll get exactly" {
                if rolledValue1 + rolledValue2 == defaultGuessValue {
                    userCredit += (initialBet * 2.4)
                    iWon = true
                } else {
                    userCredit -= (initialBet * 2.4)
                    iLost = true
                }
            }
        } else if diceNumberMessage == "Gimme two" {
            if selected == "I'll get more than" {
                if rolledValue1 > defaultGuessValue {
                    iWon = true
                    userCredit += (initialBet * 0.6)
                } else if rolledValue1 <= defaultGuessValue {
                    userCredit -= (initialBet * 0.6)
                    iLost = true
                }
            } else if selected == "I'll get less than" {
                if rolledValue1 < defaultGuessValue {
                    userCredit += (initialBet * 0.6)
                    iWon = true
                } else if rolledValue1 >= defaultGuessValue {
                    userCredit -= (initialBet * 0.6)
                    iLost = true
                }
            } else if selected == "I'll get exactly" {
                if rolledValue1 == defaultGuessValue {
                    userCredit += (initialBet * 1.2)
                    iWon = true
                } else {
                    userCredit -= (initialBet * 1.2)
                    iLost = true
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
        let diceResult = DiceResult(rolledValue1: rolledValue1, rolledValue2: rolledValue2, rolledValueSum: rolledValue1 + rolledValue2, twoDice: oneToRoll ? false : true, didIWin: iWon == true ? true : false)
        
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
