//
//  QuizQuestionComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizQuestionComponent: View {
    var question: Question
    @EnvironmentObject var viewModel: QuestionViewModel
    @State var selectedOptionIndex = 0
    var body: some View {
        NavigationStack{
            VStack{
                TitleHeader(text: question.question)
                SupportingTitleText(text: question.description)
                Picker("Question", selection: $selectedOptionIndex) {
                    ForEach(Array(question.answers.keys), id: \.self) { answerKey in
                        Text(question.answers[answerKey] ?? "").tag(question.id)
                    }
                }
                Button (action: {
                    viewModel.currentQuizProgress?.append((Array(question.answers.keys)[selectedOptionIndex]))
                }, label: {
                    NavigationLink {
                        ResultsPage()
                    } label: {
                        Text("Submit")
                    }

                })
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

#Preview {
    QuizQuestionComponent(question: Question(id: 1, question: "What is Docker?", description: "Docker is a platform for developing, shipping, and running applications in containers.", answers: ["A": "A containerization technology", "B": "A version control system", "C": "A database management system", "D": "A cloud computing platform"], multiple_correct_answers: false, correct_answers: ["A": true], explanation: "Docker is a containerization technology that allows you to package and run applications and their dependencies in isolated containers.", category: "DevOps", difficulty: "Medium"))
    }
