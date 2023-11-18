//
//  HomePage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-15.
//
import SwiftUI

struct HomePage: View {
    let user: User
    @StateObject var userViewModel: UserViewModel
    @EnvironmentObject var questionViewModel:QuestionViewModel
    init(user: User) {
        self.user = user
        _userViewModel = StateObject(wrappedValue: UserViewModel(user: user))
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
                                                    QuizContainerImageComponent(title: "HTML",image: Image("html"), themeColor: Color.red)
                                                    QuizContainerImageComponent(title: "Linux",image: Image("linux"),themeColor: Color.yellow)
                                                    QuizContainerImageComponent(title: "Docker",image: Image("docker"), themeColor: Color.gray)
                                                    QuizContainerImageComponent(title: "PHP", image: Image("php"), themeColor: Color.purple)
                                                    QuizContainerImageComponent(title: "Python", image: Image("python"), themeColor: Color.green)
                                                    QuizContainerImageComponent(title: "Javascript", image: Image("javascript"), themeColor: Color.orange)
                                                }
                                            }
                                        }
                                        Spacer()
                                }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(userViewModel)
        
    }
}

#Preview {
    HomePage(user: User(firstName: "Nicholas", lastName: "Martoccia", birthday: Date.now))
}
