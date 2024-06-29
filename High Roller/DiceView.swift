//
//  DiceView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 25/6/24.
//

import SwiftUI

struct DiceView: View {
    
    @Binding var diceSide: DiceSide
    
    @State private var counter = 3
    
    @Binding var rolledValue1: Int
    @Binding var rolledValue2: Int
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.blue)
                    .frame(width: 120, height: 120)
                
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
                    .frame(width: 113, height: 115)
                
                switch diceSide {
                case .one:
                    OneSide()
                case .two:
                    TwoSide()
                case .three:
                    ThreeSide()
                case .four:
                    FourSide()
                case .five:
                    FiveSide()
                case .six:
                    SixSide()
                }    
            }
        }
    }
}

#Preview {
    DiceView(diceSide: .constant(.four), rolledValue1: .constant(4), rolledValue2: .constant(3))
}
