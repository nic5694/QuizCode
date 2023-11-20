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
    //@Published var questions: [Question]?
    var questionsDidChange: (() -> Void)?

    @Published var questions: [Question]? {
        didSet {
            questionsDidChange?()
        }
    }
    @Published var currentQuizProgress : [String]?
    @Published var quizScreenCover = false
    @Published var isQuizStarted: Bool? = false
    @Published var currentQuizQuestionNum: Int = 0
    @Published var scrollListItem: [ScrollListItemComponent] = [
        ScrollListItemComponent(text: "Quiz: Linux 13/15"),
        ScrollListItemComponent(text: "Quiz: Docker 15/15"),
        ScrollListItemComponent(text: "Quiz: PHP 20/20"),
        ScrollListItemComponent(text: "Quiz: JavaScript 17/20"),
        ScrollListItemComponent(text: "Quiz: HTML 5/5"),
        ScrollListItemComponent(text: "Quiz: Python 11/20"),
        ScrollListItemComponent(text: "Quiz: Linux 1/1"),
        ScrollListItemComponent(text: "Quiz: HTML 7/7")
    ]
    
    func retreiveQuestions(nbOfQuestions: Int, category: String? = nil, difficulty: String, tags: String? = nil) {
        print("before the if in the view model")
        
        if category == nil || category == "", let tags = tags, !tags.isEmpty {
            print("In the first if")
            quizService.getQuestions(quantity: nbOfQuestions, category: "", difficulty: difficulty, tags: tags) { item in
                print("Adding items to the array, item: \(item)")
                DispatchQueue.main.async {
                    self.questions = (self.questions ?? []) + item
                }
            }
        } else if let category = category, tags == nil {
            print("In the second if for tags")
            quizService.getQuestions(quantity: nbOfQuestions, category: category, difficulty: difficulty, tags: "") { item in
                print("Adding items to the array, item: \(item)")
                DispatchQueue.main.async {
                    self.questions = (self.questions ?? []) + item
                }
                print("Size of the questions now: \(self.questions?.count ?? 0)")
            }
        } else {
            print("Nothing fit in")
            return
        }
        
        print("Size of the questions array: \(self.questions?.count ?? 0)")
    }
//    func retreiveQuestions(nbOfQuestions: Int, category: String? = nil, difficulty: String, tags: String? = nil){
//        print("before the if in the view model")
//        if(category == nil || category == "" && tags != nil){
//            print("In the first if")
//            quizService.getQuestions(quantity: nbOfQuestions, category: "", difficulty: difficulty, tags: tags!){
//                item in
//                print("Adding items to the array, item: \(item)")
//                DispatchQueue.main.async{
//                    self.questions?.append(contentsOf: item)
//                }
//            }
//        } else if (category != nil && tags == nil){
//            print("In the second if for tags")
//            quizService.getQuestions(quantity: nbOfQuestions, category: category!, difficulty: difficulty, tags: ""){
//                item in
//                print("Adding items to the array, item: \(item)")
//                DispatchQueue.main.async{
//                    self.questions?.append(contentsOf: item)
//                }
//                print("Size of the questions now: \(self.questions?.count)")
//            }
//        } else{
//            print("Nothing fit in")
//            return
//        }
//        
//
////        quizService.getQuestions(quantity: 10, category: "Linux", difficulty: "easy"){
////            item in
////            DispatchQueue.main.async{
////                self.questions?.append(contentsOf: item)
////            }
////        }
//        print("Size of the questions array: \(self.questions?.count)")
//    }
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
