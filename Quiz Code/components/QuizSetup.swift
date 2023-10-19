//
//  QuizSetup.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizSetup: View {
    var title: String
    var image: Image
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    image
                        .resizable()
                        .background(Color.white)
                } .cornerRadius(20)
                    .frame(width: 100, height: 100)
                    .padding()
                TitleHeader(text: title)
                
                SupportingTitleText(text: "Please select your difficulty level.")
                
                DifficultySelector()
                    .padding()
                
                SupportingTitleText(text: "How many questions? (Max 20)")
                
                CounterQuestionComponent()
                    .padding()
                NavigationLink {
                    QuizQuestionComponent(question: Question(id: 1, question: "What is Docker?", description: "Docker is a platform for developing, shipping, and running applications in containers.", answers: ["A": "A containerization technology", "B": "A version control system", "C": "A database management system", "D": "A cloud computing platform"], multiple_correct_answers: false, correct_answers: ["A": true], explanation: "Docker is a containerization technology that allows you to package and run applications and their dependencies in isolated containers.", category: "DevOps", difficulty: "Medium"))
                } label: {
                    Text("Next")
                }
                Spacer()
            }            .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("DarkGreen"))
        }
    }
}

#Preview {
    QuizSetup(title: "Linux Quiz", image: Image("linux"))
}
