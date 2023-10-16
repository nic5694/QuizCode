//
//  Question.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import Foundation
struct Question {
    let id: Int
    let question: String
    let description: String
    let answers: Dictionary<String, String>
    let multiple_correct_answers: Bool
    let correct_answers: Dictionary<String, Bool>
    let explanation: String
    let category: String
    let difficulty: String
}
