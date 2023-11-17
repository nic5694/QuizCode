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
}

struct Tag: Decodable {
    let name: String
}
//struct Question:Identifiable, Decodable {
//    let id: Int
//    let question: String
//    let description: String?
//    let answers: [String: String]
//    let multiple_correct_answers: Bool
//    let correct_answers: [String: Bool]
//    let correctAnswer: String
//    let explanation: String
//    let tags: [String: String]?
//    let category: String
//    let difficulty: String
//}
