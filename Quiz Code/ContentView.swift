//
//  ContentView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-02.
//

import SwiftUI

struct ContentView: View {
 //   @StateObject var userViewModel = UserViewModel()
    @StateObject var questionViewModel = QuestionViewModel()
    var body: some View {
        VStack {
            SignUpPage()
                .environmentObject(questionViewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
