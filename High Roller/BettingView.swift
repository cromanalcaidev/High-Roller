//
//  BettingView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 29/6/24.
//

import SwiftUI

struct BettingView: View {
    var guessYourResult = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var guessYourResult2 = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    @State var defaultGuessValue = 6
    @State var initialBet = 1
    
    @Binding var selected: String
    @State var moreOrLess = ["I'll get more than", "I'll get exactly", "I'll get less than"]
    
    var body: some View {
        if selected == "I'll get more than" {
            HStack {
                Picker("Choose more or less", selection: $selected) {
                    ForEach(moreOrLess, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Picker("Choose a number", selection: $defaultGuessValue) {
                    ForEach(guessYourResult, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        } else if selected == "I'll get less than" {
            HStack {
                Picker("Choose more or less", selection: $selected) {
                    ForEach(moreOrLess, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Picker("Choose a number", selection: $defaultGuessValue) {
                    ForEach(guessYourResult2, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        } else if selected == "I'll get exactly" {
            HStack {
                Picker("Choose more or less", selection: $selected) {
                    ForEach(moreOrLess, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Picker("Choose a number", selection: $defaultGuessValue) {
                    ForEach(guessYourResult, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
        }
    }
}

#Preview {
    BettingView(selected: .constant("I'll get exactly"))
}
