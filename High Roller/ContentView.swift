//
//  ContentView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 25/6/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            
        TabView() {
            RollDiceView()
                .tabItem {
                    Label("Hello", systemImage:"dice")
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
