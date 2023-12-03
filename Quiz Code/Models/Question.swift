//
//  Question.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import Foundation
struct Question: Identifiable, Decodable {
    let id: Int
    let question: String
    let description: String?
    let answers: [String: String?] // Make the "answers" property optional
    let multiple_correct_answers: String
    let correct_answers: [String: String]
    let correct_answer: String? // Adjusted to match the JSON key naming
    let explanation: String?
    let tip: String? // Assuming "tip" can be nil based on the JSON structure
    let tags: [Tag]?
    let category: String
    let difficulty: String
    var correctAnswers: [String: Bool] {
           var result: [String: Bool] = [:]
           for (key, value) in correct_answers {
               result[key] = value.lowercased() == "true"
           }
           return result
       }

    var isMultipleCorrectAnswers: Bool {
            return multiple_correct_answers.lowercased() == "true"
        }
    init(id: Int, question: String, description: String?, answers: [String : String?], multiple_correct_answers: String, correct_answers: [String : String], correct_answer: String?, explanation: String?, tip: String?, tags: [Tag]?, category: String, difficulty: String) {
        self.id = id
        self.question = question
        self.description = description
        self.multiple_correct_answers = multiple_correct_answers
        self.correct_answers = correct_answers
        self.correct_answer = correct_answer
        self.explanation = explanation
        self.tip = tip
        self.tags = tags
        self.category = category
        self.difficulty = difficulty
        
        var newAnswersArray = [String:String]()
        
        for (key, value) in answers {
            if let unwrappedValue = value, !unwrappedValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                newAnswersArray[key] = unwrappedValue
            }
        }
        
        self.answers = newAnswersArray
    }


}

struct Tag: Decodable {
    let name: String
}
