//
//  QuizQuestionOrchestrationComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-11-19.
//

import SwiftUI

struct QuizQuestionOrchestrationComponent: View {
    @State var userAnswers: [Int: String] = [:]
   // var correctAnswers: [Int: String] = [:]
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State var index: Int = 0
    @State var selectedOptionIndex: Int = 0
    @State var value: String = ""
    
    
    var body: some View {
        QuizQuestionComponent(question: questionViewModel.questions![self.index], selected: $value);
        Button (action: {
           // userAnswers[index, default: ""] = questionViewModel.questions![index].answers[0].key()
            userAnswers[index, default: ""] = value
            index+=1
            print(userAnswers)
            
        }, label: {
//            NavigationLink {
//                ResultsPage()
//            } label: {
                Text("Submit")
            //    }

        })
    }
}

#Preview {
    QuizQuestionOrchestrationComponent()
}
