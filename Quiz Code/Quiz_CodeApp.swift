//
//  Quiz_CodeApp.swift
//  Quiz Code
//
//  Created by nic on 2023-10-02.
//

import SwiftUI
import Firebase

@main
struct Quiz_CodeApp: App {
    init(){
        FirebaseApp.configure()
    }
    @StateObject private var quizCodeViewModel = QuestionViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(quizCodeViewModel)
                .background(Color.white)
        }
    }
}
