//
//  QuizCodeViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import Foundation
import SwiftUI
class QuestionViewModel : ObservableObject {
    private let quizService = QuizAcessService()
    @Published var questions: [Question]?
    @Published var currentQuizProgress : [String]?
    @Published var scrollListItem: [ScrollListItemComponent] = [
        ScrollListItemComponent(text: "Quiz: Linux 13/15"),
        ScrollListItemComponent(text: "Quiz: Docker 15/15"),
        ScrollListItemComponent(text: "Quiz: PHP 20/20"),
        ScrollListItemComponent(text: "Quiz: JavaScript 17/20"),
        ScrollListItemComponent(text: "Quiz: HTML 5/5"),
        ScrollListItemComponent(text: "Quiz: Python 11/20"),
        ScrollListItemComponent(text: "Quiz: Linux 1/1"),
        ScrollListItemComponent(text: "Quiz: HTML 7/7")]
    init(){
        //retreiveQuestions(category: <#T##String#>, difficulty: <#T##String#>, nbOfQuestions: <#T##Int#>)
        quizService.getQuestions(quantity: 10, category: "Linux", difficulty: "easy"){
            item in
            DispatchQueue.main.async{
                self.questions?.append(contentsOf: item)
            }
        }
        
    }
    func retreiveQuestions(category: String, difficulty: String, nbOfQuestions: Int){
        quizService.getQuestions(quantity: 10, category: "Linux", difficulty: "easy"){
            item in
            DispatchQueue.main.async{
                self.questions?.append(contentsOf: item)
            }
        }
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
