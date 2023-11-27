//
//  AnswerPicker.swift
//  Quiz Code
//
//  Created by nic on 2023-11-26.
//

import SwiftUI

struct AnswerPicker: View {
    @State private var selectedAnswer: String?
    let question: Question
    @Binding var selected: String
    var body: some View {
        VStack {
            ForEach(Array(question.answers.keys.sorted()), id: \.self) { answerKey in
                if let answer = question.answers[answerKey],
                   ((answer?.contains(where: { $0.isLetter || $0.isNumber || $0.isSymbol })) != nil) {
                    Toggle(isOn: Binding(
                        get: { selectedAnswer == answerKey },
                        set: { newValue in
                            selectedAnswer = newValue ? answerKey : nil
                        }
                    )) {
                        Text(answer ?? "")
                            .padding()
                    }.onChange(of: selectedAnswer ?? "") {newSelection in
                        selected = newSelection
                }
            }
            }
        }
    }
        
}


#Preview {
    AnswerPicker(question: Question(id: 6, question: "What", description: "This is a description", answers: ["0": "tsrt", "test": "Test"], multiple_correct_answers: "false", correct_answers: ["0": "test"], correct_answer: "Test", explanation: "This is the explanation", tip: "tip of the day", tags: [], category: "Coding", difficulty: "easy"), selected: Binding.constant("test"))
}
