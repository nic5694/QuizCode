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
    @StateObject var questionViewModel = QuestionViewModel()
    init(user: User) {
        self.user = user
        _userViewModel = StateObject(wrappedValue: UserViewModel(user: user))
    }
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    SupportingTitleText(text: "Hi \(userViewModel.user.firstName), please select the subject you would like to test yourself on.")
                   
                    NavigationLink{
                        SettingsView()
                    } label: {
                        AnimationGear()
                            .tint(.white)
                            .navigationBarTitle("Home", displayMode: .inline)
                            .onAppear{
                                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 30, weight: .bold)]
                            }
                    }
                    Spacer()
                }
               
                VStack{
                    Spacer()
                    HStack{
                        NavigationLink {
                            QuizSetup(title: "HTML Quiz", image: Image("html"))
                        } label: {
                            QuizContainerImageComponent(image: Image("html"))
                        }
                        NavigationLink(destination: {
                            QuizSetup(title: "Linux Quiz", image: Image("linux"))
                        }) {
                            QuizContainerImageComponent(image: Image("linux"))
                        }
                    }
                    Spacer()
                    HStack{
                        NavigationLink {
                            QuizSetup(title: "Docker Quiz", image: Image("docker"))
                        } label: {
                            QuizContainerImageComponent(image: Image("docker"))
                        }
                        NavigationLink {
                            QuizSetup(title: "PHP Quiz", image: Image("php"))
                        } label: {
                            QuizContainerImageComponent(image: Image("php"))
                        }
                    }
                    Spacer()
                    HStack{
                        NavigationLink {
                            QuizSetup(title: "Python", image: Image("python"))
                        } label: {
                            QuizContainerImageComponent(image: Image("python"))
                        }
                        NavigationLink{
                            QuizSetup(title: "Javascript Quiz", image: Image("javascript"))
                        } label:{
                            QuizContainerImageComponent(image: Image("javascript"))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)//.background(Color("DarkGreen"))
        }
    }
}

#Preview {
    HomePage(user: User(firstName: "Nicholas", lastName: "Martoccia", birthday: Date.now))
}
