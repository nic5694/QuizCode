//
//  QuizQuestionOrchestrationComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-11-19.
//

import SwiftUI

struct QuizQuestionOrchestrationComponent: View {
    @State var userAnswers: [String] = []
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State var index: Int = 0
    @State var selectedOptionIndex: Int = 0
    @State var value: String = ""
    

    func showResultsCheck(){
        if((self.index) == questionViewModel.questions?.count ?? 0){
            questionViewModel.showResults.toggle()
        }
    }
    func getCategoryOrTag() -> String{
        if(questionViewModel.questions![0].category == "" || questionViewModel.questions![0].category == "Code"){
            return questionViewModel.questions![0].tags![0].name
        } else {
        return questionViewModel.questions![0].category
        }
    }
    
    var body: some View {
        if(index < questionViewModel.questions?.count ?? 0){
            QuizQuestionComponent(question: questionViewModel.questions![self.index], selected: $value);
        }
            Button (action: {
                if(value != ""){
                    userAnswers.append(value)
                    self.index+=1
                    print(userAnswers)
                    showResultsCheck()
                }
            }, label: {
                    NavigationLink {
                    } label: {}.fullScreenCover(isPresented: $questionViewModel.showResults){
                        ResultsPage(results: questionViewModel.calculateScore(userAnswers: userAnswers), subject: getCategoryOrTag())
                    }
                    Text("Submit")
            })
    }
}
    
    #Preview {
        QuizQuestionOrchestrationComponent()
    }
