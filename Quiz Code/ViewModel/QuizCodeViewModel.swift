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
    @Published var currentQuizProgress : [String]?
    @Published var scrollListItem: [ScrollListItem] = [
        ScrollListItem(text: "Quiz: Linux 13/15"),
        ScrollListItem(text: "Quiz: Docker 15/15"),
        ScrollListItem(text: "Quiz: PHP 20/20"),
        ScrollListItem(text: "Quiz: JavaScript 17/20"),
        ScrollListItem(text: "Quiz: HTML 5/5"),
        ScrollListItem(text: "Quiz: Python 11/20"),
        ScrollListItem(text: "Quiz: Linux 1/1"),
        ScrollListItem(text: "Quiz: HTML 7/7")]
    init(){
        self.user = User(birthday: Date())
    }
    func retreiveQuestions(category: String, difficulty: String, nbOfQuestions: Int, Tags: [String]){
        
    }
    func getScore(userAnswers: [String: String],answers: [String: String]) -> String{
        var correctCount = 0
        let totalQuestions = userAnswers.count
        
        for (question, userAnswer) in userAnswers {
            if let correctAnswer = answers[question] {
                if userAnswer == correctAnswer {
                    correctCount += 1
                }
            }
        }
        return "\(correctCount) / \(totalQuestions)"
    }
    
}
