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
    @StateObject var userViewModel = UserViewModel(/*user: User(firstName: "", lastName: "", userName: "")*/)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(quizCodeViewModel)
                .environmentObject(userViewModel)
                .background(Color.white)
        }
    }
}
