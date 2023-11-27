//
//  ResultsPage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-18.
//

import SwiftUI

struct ResultsPage: View {
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    var results: String
    var subject: String
    func calculateScore()-> String{
        let components = results.components(separatedBy: "/")
        guard components.count == 2, let numerator = Int(components[0]), let denominator = Int(components[1]) else {
            return ""
        }
        if(numerator == denominator){
            return "Congrats!"
        } else {
            return "Goodjob but try again to get 100%."
        }
    }
    var body: some View {
        VStack{
//            TitleHeader(text: "Results: \(viewModel.getScore(userAnswers: ["A": "ls", "B":"ls-l"], answers: ["A" : "cd", "B": "ls-l"]))")
            Text("Results: \(results)").titleHeaderOnWhiteBackgroundStyle()
            
            Text(calculateScore()).supportingTitleTextOnWhiteBackgroundStyle()
//            SupportingTitleText(text: "Please try again if you didn't get 100")
          
            Button(action:{
                questionViewModel.quizInProgress.toggle()
                questionViewModel.showResults.toggle()
                questionViewModel.questions = []
                var result = Score(subject: subject, grade: results)
                scoreViewModel.addScore(score: result)
//                NavigationLink(destination: {
//                    HomePage(user: userViewModel.user)
//                }, label: {})
            }, label: {
                Text("Back to home!")
            })

            

            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}

#Preview {
    ResultsPage(results: "15/20",subject: "Linux")
}
