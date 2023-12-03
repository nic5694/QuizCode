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
    
    @Published var showResults = false
    @Published var quizInProgress = false
    var questionsDidChange: (() -> Void)?

    @Published var questions: [Question]? {
        didSet {
            questionsDidChange?()
        }
    }
    @Published var currentQuizProgress : [String]?
//    @Published var isQuizStarted: Bool = false
    @Published var currentQuizQuestionNum: Int = 0
//    @Published var scrollListItem: [ScrollListItemComponent] = [
//        ScrollListItemComponent(text: "Quiz: Linux 13/15"),
//        ScrollListItemComponent(text: "Quiz: Docker 15/15"),
//        ScrollListItemComponent(text: "Quiz: PHP 20/20"),
//        ScrollListItemComponent(text: "Quiz: JavaScript 17/20"),
//        ScrollListItemComponent(text: "Quiz: HTML 5/5"),
//        ScrollListItemComponent(text: "Quiz: Python 11/20"),
//        ScrollListItemComponent(text: "Quiz: Linux 1/1"),
//        ScrollListItemComponent(text: "Quiz: HTML 7/7")
//    ]
//    private let latestQuizKey = "latestQuiz"
//    var latestQuiz: String {
//            get {
//                return UserDefaults.standard.string(forKey: latestQuizKey) ?? ""
//            }
//            set {
//                UserDefaults.standard.set(newValue, forKey: latestQuizKey)
//            }
//        }
//    
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
//    func getAnswerArray() -> [String]{
//        var answer: [String] = []
//        for question in questions!{
//            
//            answer.append(question.correct_answer!)
//        }
//        return answer
//    }
    func getAnswerArray() -> [String] {
        var answers: [String] = []

        for question in questions! {
            if let correctAnswer = question.correct_answer, !correctAnswer.isEmpty {
                answers.append(correctAnswer)
            } else if let correctAnswers = question.correct_answers as? [String: String] {
                // Handle the case where question.correct is nil or empty
                // and fallback to checking question.correct_answers

                if let answerB = correctAnswers["answer_b_correct"], answerB == "true" {
                    answers.append(answerB)
                } else {
                    // Handle other cases or add a default value
                    answers.append("Default Answer")
                }
            } else {
                // Handle the case where both question.correct and question.correct_answers are nil
                print("Error: Both question.correct and question.correct_answers are nil")
            }
        }

        return answers
    }
    func calculateScore(userAnswers: [String])-> String{
        let answers = getAnswerArray()
        var count = 0
        var correctAnswers = 0
        for a in userAnswers{
            if(a == answers[0]){
                correctAnswers += 1
            }
            count += 1
        }
        return "\(correctAnswers)/\(count)"
    }
    
}
