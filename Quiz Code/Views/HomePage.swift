//
//  HomePage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//
import SwiftUI

struct HomePage: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var scoreViewModel: ScoreViewModel
    @EnvironmentObject var questionViewModel:QuestionViewModel
    @AppStorage("latestQuizTitle") private var latestQuizTitle: String = ""
    let quizComponents = [
            ("HTML", Image("html"), Color.red),
            ("Linux", Image("linux"), Color.yellow),
            ("Docker", Image("docker"), Color.gray),
            ("PHP", Image("php"), Color.purple),
            ("Python", Image("python"), Color.green),
            ("Javascript", Image("javascript"), Color.orange)
        ]
    init() {
        _scoreViewModel = StateObject(wrappedValue: ScoreViewModel())
    }
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                }
                VStack{
                    HStack{
                        Text("Hi \(userViewModel.user.firstName), please select the subject you would like to test yourself on.").supportingTitleTextOnBlueBackgroundStyle()
                        NavigationLink{
                            SettingsView()
                        } label: {
                            AnimationGear()
                                .tint(.white)
                                .navigationBarTitle("Home", displayMode: .inline)
                                .toolbarColorScheme(.dark, for: .navigationBar)
                                .onAppear{
                                    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 30, weight: .bold)]
                                }
                                .toolbarBackground(Color.blue, for: .navigationBar)
                                .toolbarBackground(.visible, for: .navigationBar)
                        }
                    }
                    .background(Color.blue)
                    .cornerRadius(0.5)
                    Spacer()
                    ScrollView(.horizontal){
                        VStack{
                            HStack{
                                if let latestQuizIndex = quizComponents.firstIndex(where: { $0.0 == latestQuizTitle }) {
                                    let reorderedQuizzes = quizComponents[latestQuizIndex...] + quizComponents[..<latestQuizIndex]
                                    ForEach(reorderedQuizzes, id: \.0) { title, image, themeColor in
                                        QuizContainerComponent(title: title, image: image, themeColor: themeColor)
                                    }
                                } else {
                                    ForEach(quizComponents, id: \.0) { title, image, themeColor in
                                        QuizContainerComponent(title: title, image: image, themeColor: themeColor)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environmentObject(scoreViewModel)
    }
}

#Preview {
    HomePage()
}
