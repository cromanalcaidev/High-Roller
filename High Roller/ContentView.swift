//
//  ContentView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 25/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var diceSide = DiceSide.four
    @State private var secondDiceSide = DiceSide.two
    
    var body: some View {
            
        TabView() {
            RollDiceView()
                .tabItem {
                    Label("Game on!", systemImage:"dice")
                }
            
            ResultsView()
                .tabItem {
                    Label("Check your results", systemImage: "list.number")
                }
        }
    }
}

#Preview {
    ContentView()
}
