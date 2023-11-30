//
//  HomePage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//
import SwiftUI

struct HomePage: View {
    var user: User
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var scoreViewModel: ScoreViewModel
    @EnvironmentObject var questionViewModel:QuestionViewModel
    init(user: User) {
        
        self.user = user
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
                                                SettingsView(
//                                                    firstName: userViewModel.user.firstName, lastName: userViewModel.user.lastName, userName: userViewModel.user.userName
                                                )
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
                                                    QuizContainerComponent(title: "HTML",image: Image("html"), themeColor: Color.red)
                                                    QuizContainerComponent(title: "Linux",image: Image("linux"),themeColor: Color.yellow)
                                                    QuizContainerComponent(title: "Docker",image: Image("docker"), themeColor: Color.gray)
                                                    QuizContainerComponent(title: "PHP", image: Image("php"), themeColor: Color.purple)
                                                    QuizContainerComponent(title: "Python", image: Image("python"), themeColor: Color.green)
                                                    QuizContainerComponent(title: "Javascript", image: Image("javascript"), themeColor: Color.orange)
                                                }
                                            }
                                        }
                                        Spacer()
                                }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(userViewModel)
            .environmentObject(scoreViewModel)
        
    }
}

#Preview {
    HomePage(user: User(firstName: "Nicholas", lastName: "Martoccia", userName: "Tester234"))
}
