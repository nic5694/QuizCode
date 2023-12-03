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
    @Published var currentQuizQuestionNum: Int = 0
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
    func getAnswerArray() -> [String] {
        var answers: [String] = []

        for question in questions! {
            if let correctAnswers = question.correct_answers as? [String: String] {
                // Iterate through all answers for the current question
                for (answerKey, isCorrect) in correctAnswers {
                    // Check if the current answer is correct (considering "_correct" suffix)
                    if isCorrect == "true" && answerKey.hasSuffix("_correct") {
                        // Remove the "_correct" suffix before appending to the answers array due to the specifications of the API
                        let cleanAnswer = String(answerKey.dropLast(8)) // 8 is the length of "_correct"
                        answers.append(cleanAnswer)
                    }
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
            if(a == answers[count]){
             //   print("Correcting: This is user answer: \(a) and this is correction \(answers)")
                correctAnswers += 1
            }
            count += 1
        }
        return "\(correctAnswers)/\(count)"
    }
    
}
