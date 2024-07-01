//
//  TestViewTwo.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 1/7/24.
//

import SwiftUI

struct TestViewTwo: View {
    @State var currentDate = Date.now
    @State var count = 0
    
    @State var dateTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // date timer update the time for every second
    
    @State var counTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // updates the counter.

    var body: some View {
        VStack(spacing: 20) {
            Text("Date: \(currentDate.formatted(date: .numeric, time: .standard))")
                .font(.title)
                .onReceive(dateTimer) { input in
                    currentDate = input
                }
            
            Text("Count: \(count)")
                .font(.largeTitle)
                .onReceive(counTimer) { _ in
                    count += 1
                }
            
            Group {
                Button("Stop The Timers") {
                    dateTimer.upstream.connect().cancel()
                    counTimer.upstream.connect().cancel()
                }
                Button("Restart the Timers") {
                    self.dateTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    self.counTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

                }
            }
            .padding()
            .background(.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
        
        }
    }
}

#Preview {
    TestViewTwo()
}
