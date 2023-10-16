//
//  SettingsView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel:QuizCodeViewModel
    var body: some View {
        VStack{
            TitleHeader(text: "Settings")
        }
    }
}

#Preview {
    SettingsView()
}
