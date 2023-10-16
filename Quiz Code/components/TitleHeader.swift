//
//  TitleHeaderView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct TitleHeader: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(.white)
        
    }
}

#Preview {
    TitleHeader(text: "Welcome to Quiz Code")
}
