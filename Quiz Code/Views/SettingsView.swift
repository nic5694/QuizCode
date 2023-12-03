//
//  SettingsView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI
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
