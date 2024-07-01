//
//  TestView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 1/7/24.
//

import SwiftUI

struct TestView: View {
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let fakeTimer = Timer.publish(every: 1, on: .main, in: .common)
    
    @State var isActive = false
    
    @State private var counter = 0
    
    var body: some View {
        Text("\(counter)")
            .onReceive(timer) { time in
                if isActive {
                    counter += 1
                }
            }
        Button("Press me") {
            execute()
        }
    }
    
    func execute() {
        isActive.toggle()
        
        if isActive == true {
            counter = 0
        }
    }
}

#Preview {
    TestView()
}
