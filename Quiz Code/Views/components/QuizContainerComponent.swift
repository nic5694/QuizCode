//
//  QuizContainerComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//

import SwiftUI

struct QuizContainerComponent: View {
    var title: String
    var image: Image
    var themeColor: Color
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State private var selectedDifficulty: String = ""
    @State private var numberOfQuestions: Int = 10
    let latestQuizTitleKey = "latestQuizTitle"
    let latestQuizDifficultyKey = "latestQuizDifficulty"
    let latestQuizQestionNumKey = "latestQuizQestionNum"
    @AppStorage("latestQuizTitle") private var latestQuizTitle: String = ""
    @AppStorage("latestQuizDifficulty") private var latestQuizDifficulty: String = ""
    @AppStorage("latestQuizQestionNum") private var latestQuizQuestionNum: Int = 0
    private let latestQuizKey = "latestQuiz"
    
    var body: some View {
        VStack{
            VStack{
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                Text(title).titleHeaderOnColourBackgroundStyle()
                
            }
            .frame(width: 360)
            .background(Color(themeColor))
            VStack{
                Text("Please select your difficulty level.")
                    .frame(width: 300,height: 34)
                    .foregroundStyle(Color.black)
                
                
                DifficultySelector(selectedDifficulty: $selectedDifficulty)
                
                Text("How many questions? (Max 20)").foregroundStyle(Color.black)
                
                CounterQuestionComponent(value: $numberOfQuestions)
                
                NavigationLink{
                    
                }label: {
                    Button(action: {
                            if(title == "Docker" || title == "Linux"){
                                questionViewModel.retreiveQuestions(nbOfQuestions: numberOfQuestions, category: title, difficulty: selectedDifficulty)
                            }
                            else{
                                questionViewModel.retreiveQuestions(nbOfQuestions: numberOfQuestions, category: "", difficulty: selectedDifficulty, tags: title)
                                
                            }
                            
                            questionViewModel.currentQuizQuestionNum = 0
                            latestQuizTitle = title
                            latestQuizDifficulty = selectedDifficulty
                            latestQuizQuestionNum = numberOfQuestions
                        
                    }, label: {
                        Text("Start")
                    }).fullScreenCover(isPresented: $questionViewModel.quizInProgress){
                        QuizQuestionOrchestrationComponent()
                       
                    }
                    
                }
                .onAppear{
                    if (latestQuizTitle == title){
                        selectedDifficulty = latestQuizDifficulty
                        numberOfQuestions = latestQuizQuestionNum
                    }
                    questionViewModel.questionsDidChange = {
                        if let questions = questionViewModel.questions, !questions.isEmpty {
                            questionViewModel.quizInProgress.toggle()
                        }
                    }
                }
            }
            Spacer()
        }
        .frame(width: 360, height: 450)
        .background(Color("BackgroundComponentWhite"))
        .padding(.leading)
    }
    
    
    
}

#Preview {
    QuizContainerComponent(title: "Php Quiz", image: Image("php"), themeColor: Color.purple)
}
