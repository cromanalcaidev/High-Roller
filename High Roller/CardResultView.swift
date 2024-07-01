//
//  CardResultView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 30/6/24.
//

import SwiftUI

struct CardResultView: View {
    
    var border: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(border)
                .frame(maxWidth: 330, maxHeight: 100)
            
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.white)
                .frame(maxWidth: 323, maxHeight: 95)
        }
        .frame(maxHeight: 130, alignment: .center)
    }
}

#Preview {
    CardResultView(border: .green)
}
