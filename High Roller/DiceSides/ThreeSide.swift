//
//  ThreeSide.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 28/6/24.
//

import SwiftUI

struct ThreeSide: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                
                Spacer()
                
                Circle()
                    .frame(width: 20, height: 20)
            }
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
            
            Spacer()
            
            HStack {
                
                Circle()
                    .frame(width: 20, height: 20)
                
                Spacer()
                
                Circle()
                    .frame(width: 20, height: 20)
                
            }
        }
        .frame(width: 90, height: 90)
    }
}

#Preview {
    ThreeSide()
}
