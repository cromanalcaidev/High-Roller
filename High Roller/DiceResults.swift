//
//  DiceResults.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 27/6/24.
//

import Foundation

@Observable
class DiceResults {
    var diceResults = [DiceResult]() {
        didSet {
            saveData()
        }
    }
    
    static let example = [DiceResult(rolledValue1: 1, rolledValue2: 4, rolledValueSum: 5, twoDice: true, didIWin: false)]
    
    let savePath = URL.documentsDirectory.appending(path: "SavedResults")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            diceResults = try JSONDecoder().decode([DiceResult].self, from: data)
        } catch {
            print("Fatal error")
        }
    }
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(diceResults)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
}

struct DiceResult: Codable, Hashable, Identifiable {
    var id = UUID()
    let rolledValue1: Int
    let rolledValue2: Int?
    let rolledValueSum: Int
    let twoDice: Bool
    let didIWin: Bool
    
    static let example = DiceResult(rolledValue1: 1, rolledValue2: 4, rolledValueSum: 5, twoDice: true, didIWin: true)
}


enum DiceSide: CaseIterable {
    case one, two, three, four, five, six
}
