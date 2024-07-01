//
//  BettingView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 29/6/24.
//

import SwiftUI

struct BettingView: View {
    
    var greaterThanFor2Dice = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    var exactlyFor2Dice = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    var lessThanFor2Dice = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var greaterThanFor1Die = [1, 2, 3, 4, 5]
    var exactlyFor1Die = [1, 2, 3, 4, 5,6]
    var lessThanFor1Die = [2, 3, 4, 5, 6]
    
    
    @Binding var defaultGuessValue: Int
    @State var initialBet = 1
    @Binding var oneToRoll: Bool
    
    @Binding var selected: String
    @State var moreOrLess = ["I'll get more than", "I'll get exactly", "I'll get less than"]
    
    var body: some View {
        Section {
            Text("Guess your result!")
                .font(.headline)
            
            if oneToRoll == true {
                if selected == "I'll get more than" {
                    HStack {
                        Picker("Choose more or less", selection: $selected) {
                            ForEach(moreOrLess, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Choose a number", selection: $defaultGuessValue) {
                            ForEach(greaterThanFor1Die, id: \.self) {
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
                            ForEach(lessThanFor1Die, id: \.self) {
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
                            ForEach(exactlyFor1Die, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
            } else if oneToRoll == false {
                if selected == "I'll get more than" {
                    HStack {
                        Picker("Choose more or less", selection: $selected) {
                            ForEach(moreOrLess, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        Picker("Choose a number", selection: $defaultGuessValue) {
                            ForEach(greaterThanFor2Dice, id: \.self) {
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
                            ForEach(lessThanFor2Dice, id: \.self) {
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
                            ForEach(exactlyFor2Dice, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
            }
        }
        .frame(height: 20, alignment: .center)
    }
}

#Preview {
    BettingView(defaultGuessValue: .constant(3), oneToRoll: .constant(true), selected: .constant("I'll get exactly"))
}
