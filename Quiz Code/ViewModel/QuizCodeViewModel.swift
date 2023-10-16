//
//  QuizCodeViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import Foundation
import SwiftUI
class QuizCodeViewModel : ObservableObject {
    @Published var user : User
    @Published var questions: [Question]?
    init(){
        self.user = User(birthday: Date())
    }
    func retreiveQuestions(category: String, difficulty: String, nbOfQuestions: Int, Tags: [String]){
        
    }
    
}
