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
    @EnvironmentObject var viewModel: QuestionViewModel
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
                TitleHeader(text: question.question)
                SupportingTitleText(text: question.description ?? "")
                Picker("Question", selection: $selected) {
                    ForEach(Array(question.answers.keys.sorted()), id: \.self) { answerKey in
                        if(question.answers[answerKey] != nil) {
                           // Text((question.answers[answerKey])! ?? "").tag(question.id)
                            if let answer = question.answers[answerKey] {
                                if(answer != nil || answer != ""){
                                    Text(answer ?? "").tag(answerKey)
                                }
                            }
                        }
                      // Text((question.answers[answerKey])! ?? "").tag(answerKey)
                       // Text(((question.answers[answerKey] ?? "") ?? "")).tag(answerKey)
                       
                    }
                }
                
               
//                let selectedValue = question.answers[Array(question.answers.keys)[selectedOptionIndex]] ?? ""

//                {
//
//                   
//                    
//                } label: {
//                    Text("Next")
//                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("DarkGreen"))
        }
    }
}

//#Preview {
//    QuizQuestionComponent(question: Question(id: 1, question: "What is Docker?", description: "Docker is a platform for developing, shipping, and running applications in containers.", answers: ["A": "A containerization technology", "B": "A version control system", "C": "A database management system", "D": "A cloud computing platform"], multiple_correct_answers: false, correct_answers: ["A": true], explanation: "Docker is a containerization technology that allows you to package and run applications and their dependencies in isolated containers.", category: "DevOps", tags: , difficulty: "Medium", correctAnswer: "A cloud computing platform"))
//    }

