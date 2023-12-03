//
//  SettingsView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI

//struct SettingsView: View {
//    @EnvironmentObject var userViewModel: UserViewModel
//    @EnvironmentObject var questionViewModel: QuestionViewModel
//    @EnvironmentObject var scoreViewModel: ScoreViewModel
//    @State var firstName: String = ""
//    @State var lastName: String = ""
//    @State var userName: String = ""
//    func deleteItems(at offsets: IndexSet) {
//        for index in offsets {
//            let deletedScore = scoreViewModel.scoreList[index]
//            scoreViewModel.deleteScore(score: deletedScore)
//        }
//        scoreViewModel.scoreList.remove(atOffsets: offsets)
//    }
//    
//    var body: some View {
//        NavigationStack{
//            
//            Form{
//                Section(header: Text("User Information")){
//                    LabeledContent{
//                        TextField("user123", text: $userName)
//                    } label: {
//                        Text("UserName: ")
//                    }.padding()
//                    LabeledContent{
//                        TextField("John", text: $firstName)
//                    } label: {
//                        Text("First Name: ")
//                    }.padding()
//                    LabeledContent{
//                        TextField("Dhoe", text: $lastName)
//                    } label: {
//                        Text("Last Name: ")
//                    }
//                    HStack(alignment: .center){
//                        Button(action: {
//                            if(userViewModel.tobeUpdatedUser.firstName != firstName ||
//                               userViewModel.tobeUpdatedUser.lastName != lastName ||
//                                userViewModel.tobeUpdatedUser.userName != userName) {
//                                    userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: userName))
//                                }
//                        }, label: {
//                            Text("Save Changes")
//                        })
//                    }
//                    
//                }
//            }
//            .frame(maxWidth: 500, maxHeight: 400)
//            .cornerRadius(20.0)
//            .padding()
//            List{
//                ScrollView{
//                    ForEach(scoreViewModel.scoreList, id: \.id) { item in
//                        ScrollListItemComponent(text: "Quiz: \(item.subject) \(item.grade)")
//                    }.onDelete(perform: { indexSet in
//                        deleteItems(at: indexSet)
//                    })
//                    .background(Color(.white))
//                    .cornerRadius(20.0)
//                    .padding()
//                }.frame(maxHeight: 310)
//            }
//        }
//        .background(Color.white)
//        .navigationTitle("Settings")
//        .onAppear{
//            self.firstName = userViewModel.user.firstName//userRepo.
//            self.lastName = userViewModel.user.firstName//.userRepo.user.lastName
//            self.userName = userViewModel.user.userName//userRepo.
//            print("In the on appear this is the user \(userViewModel.user)")
//        }
//    }
//}

//
//struct SettingsView: View {
//    @EnvironmentObject var userViewModel: UserViewModel
//    @EnvironmentObject var questionViewModel: QuestionViewModel
//    @EnvironmentObject var scoreViewModel: ScoreViewModel
//    @State var firstName: String = ""
//    @State var lastName: String = ""
//    @State var userName: String = ""
//
//    func deleteItems(at offsets: IndexSet) {
//        for index in offsets {
//            let deletedScore = scoreViewModel.scoreList[index]
//            scoreViewModel.deleteScore(score: deletedScore)
//        }
//        scoreViewModel.scoreList.remove(atOffsets: offsets)
//    }
//
//    var body: some View {
//        NavigationStack {
//            List {
//                Section(header: Text("User Information")) {
//                    Group {
//                        LabeledContent {
//                            TextField("user123", text: $userName)
//                        } label: {
//                            Text("UserName: ")
//                        }.padding()
//                        LabeledContent {
//                            TextField("John", text: $firstName)
//                        } label: {
//                            Text("First Name: ")
//                        }.padding()
//                        LabeledContent {
//                            TextField("Dhoe", text: $lastName)
//                        } label: {
//                            Text("Last Name: ")
//                        }.padding()
//                        HStack(alignment: .center) {
//                            
//                            Spacer()
//                            Button(action: {
//                                if userViewModel.tobeUpdatedUser.firstName != firstName ||
//                                    userViewModel.tobeUpdatedUser.lastName != lastName ||
//                                    userViewModel.tobeUpdatedUser.userName != userName {
//                                        userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: userName))
//                                    }
//                            }, label: {
//                                Text("Save Changes")
//                            }).padding()
//                            Spacer()
//                        }
//                    }
//                }
//
//                Section(header: Text("Scores")) {
//                    ForEach(scoreViewModel.scoreList, id: \.id) { item in
//                        ScrollListItemComponent(text: "Quiz: \(item.subject) \(item.grade)")
//                            .background(Color(.white))
//                            .cornerRadius(20.0)
//                            .padding()
//                    }
//                    .onDelete(perform: { indexSet in
//                        deleteItems(at: indexSet)
//                    })
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .background(Color.white)
//        .navigationTitle("Settings")
//        .onAppear {
//            self.firstName = userViewModel.user.firstName
//            self.lastName = userViewModel.user.firstName
//            self.userName = userViewModel.user.userName
//            print("In the on appear this is the user \(userViewModel.user)")
//        }
//    }
//}

struct SettingsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    @State private var isEditingUser: Bool = false  // Track if the user information sheet is presented

    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let deletedScore = scoreViewModel.scoreList[index]
            scoreViewModel.deleteScore(score: deletedScore)
        }
        scoreViewModel.scoreList.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("User Information")) {
                    Group {
                        LabeledContent {
                            Text(userViewModel.user.userName)
                        } label: {
                            Text("UserName: ")
                        }.padding()
                        LabeledContent {
                            Text(userViewModel.user.firstName)
                        } label: {
                            Text("First Name: ")
                        }.padding()
                        LabeledContent {
                            Text(userViewModel.user.lastName)
                        } label: {
                            Text("Last Name: ")
                        }.padding()
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: {
                                isEditingUser.toggle()
                            }, label: {
                                Text("Edit")
                            }).padding()
                            Spacer()
                        }
                    }
                }

                Section(header: Text("Scores")) {
                    ForEach(scoreViewModel.scoreList, id: \.id) { item in
                        ScrollListItemComponent(text: "Quiz: \(item.subject) \(item.grade)")
                            .background(Color(.white))
                            .cornerRadius(20.0)
                            .padding()
                    }
                    .onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color.white)
        .navigationTitle("Settings")
        .sheet(isPresented: $isEditingUser, content: {
            UserInformationFormView(userViewModel: userViewModel, isPresented: $isEditingUser)
        })
    }
}
