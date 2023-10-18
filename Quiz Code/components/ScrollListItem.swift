//
//  ScrollListItem.swift
//  Quiz Code
//
//  Created by nic on 2023-10-18.
//

import SwiftUI

struct ScrollListItem: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .frame(maxWidth: .infinity)
            .presentationCornerRadius(20.0)
            .background(Color(.gray))
    }
}

#Preview {
    ScrollListItem(text: "Testing the item")
}
