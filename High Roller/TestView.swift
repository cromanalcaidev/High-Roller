//
//  TestView.swift
//  High Roller
//
//  Created by Carlos Román Alcaide on 29/6/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: 330, maxHeight: 200)
            
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.white)
                .frame(maxWidth: 323, maxHeight: 194)
        }
    }
}

#Preview {
    TestView()
}
