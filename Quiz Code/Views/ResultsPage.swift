//
//  ResultsPage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-18.
//

import SwiftUI

struct ResultsPage: View {
    @EnvironmentObject var viewModel: QuestionViewModel
    var body: some View {
        VStack{
            TitleHeader(text: "Results: \(viewModel.getScore(userAnswers: ["A": "ls", "B":"ls-l"], answers: ["A" : "cd", "B": "ls-l"]))")
            SupportingTitleText(text: "Please try again if you didn't get 100")
          
                NavigationLink {
                    //HomePage()
                } label: {
                    Text("Back to home!")
                }
            
            
            

            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGreen"))
    }
}

#Preview {
    ResultsPage()
}
