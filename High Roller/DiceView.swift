//
//  DiceView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 25/6/24.
//

import SwiftUI

struct DiceView: View {
    
    var body: some View {
        
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.blue)
                    .frame(width: 120, height: 120)
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
                    .frame(width: 113, height: 115)
                
                OneSide()
            }
            
        }
        
    }
}

#Preview {
    DiceView()
}
