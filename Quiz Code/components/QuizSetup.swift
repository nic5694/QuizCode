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
            Button {
                
            } label: {
                Text("Start")
                    .frame(width: 100, height: 100)
                    .background()
            }

          Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("DarkGreen"))
    }
}

#Preview {
    QuizSetup(title: "Linux Quiz", image: Image("linux"))
}
