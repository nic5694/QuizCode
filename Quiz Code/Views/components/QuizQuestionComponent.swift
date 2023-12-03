//
//  QuizQuestionComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizQuestionComponent: View {
    var question: Question
    var options: [String]
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @Binding var selected: String
    init(question: Question, selected: Binding<String>) {
        self.question = question
        options = []
        self._selected = selected
        prepList()
    }
    mutating func prepList() {
        for (key, value) in question.answers {
            if let unwrappedValue = value {
                if(unwrappedValue != ""){
                    options.append(key)
                }
            }
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                Text(question.question).titleHeaderOnWhiteBackgroundStyle()
                Text(question.description ?? "").supportingTitleTextOnWhiteBackgroundStyle()
                AnswerPicker(question: self.question, selected: $selected)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BackgroundComponentWhite"))
        }
    }
}


#Preview {
    QuizQuestionComponent(question: Question(id: 6, question: "What", description: "This is a description", answers: ["0": "tsrt", "test": "Test"], multiple_correct_answers: "false", correct_answers: ["0": "test"], correct_answer: "Test", explanation: "This is the explanation", tip: "tip of the day", tags: [], category: "Coding", difficulty: "easy"), selected: Binding.constant("test"))
    
    }

