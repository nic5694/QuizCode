//
//  SupportingTitleText.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct SupportingTitleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
    }
}

#Preview {
    SupportingTitleText(text: "Please enter your information below foauhf wjafdiojaf epaosfhjqa piheajf pahfi ")
}
