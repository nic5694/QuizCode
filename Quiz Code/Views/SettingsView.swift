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
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userName: String = ""
    
//    init(firstName: String, lastName: String, userName: String) {
//        _firstName = State(initialValue: userViewModel.user.firstName)
//        _lastName = State(initialValue: userViewModel.user.lastName)
//        _userName = State(initialValue: userViewModel.user.userName)
//        self.firstName = userViewModel.
       // _birthday = State(initialValue: birthday)
//    }
    func deleteItems(at offsets: IndexSet) {
        // Get the indices of the items to be deleted
        //        let indicesToDelete = Array(offsets)
        //
        //        // Use the indices to find the corresponding objects in the array
        //        let itemsToDelete = indicesToDelete.map { scoreViewModel.scoreList[$0] }
        //
        //        // Call the ScoreViewModel to delete the items
        //        scoreViewModel.deleteScore(score: itemsToDelete[0])
        //
        //        // Remove the items from the array
        //        scoreViewModel.scoreList.remove(atOffsets: offsets)
        for index in offsets {
            let deletedScore = scoreViewModel.scoreList[index]
            scoreViewModel.deleteScore(score: deletedScore)
        }
        scoreViewModel.scoreList.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack{
            
            Form{
                Section(header: Text("User Information")){
                    LabeledContent{
                        TextField("user123", text: $userName)
                    } label: {
                        Text("UserName: ")
                    }.padding()
                    LabeledContent{
                        TextField("John", text: $firstName)
                    } label: {
                        Text("First Name: ")
                    }.padding()
                    LabeledContent{
                        TextField("Dhoe", text: $lastName)
                    } label: {
                        Text("Last Name: ")
                    }
                    HStack(alignment: .center){
                        Button(action: {
                            let updatedUser = User(firstName: firstName, lastName: lastName, userName: userName)
                            userViewModel.tobeUpdatedUser = updatedUser
                            userViewModel.updateUser()
                            //   userViewModel.updateUser(user: updatedUser)
                        }, label: {
                            Text("Save Changes")
                        })
                    }
                    
                }
            }
            .frame(maxWidth: 500, maxHeight: 400)
            .cornerRadius(20.0)
            .padding()
            //  ScrollView {
            List{
                ScrollView{
                    ForEach(scoreViewModel.scoreList, id: \.id) { item in
                        ScrollListItemComponent(text: "Quiz: \(item.subject) \(item.grade)")
                    }.onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                    .background(Color(.white))
                    .cornerRadius(20.0)
                    .padding()
                }.frame(maxHeight: 310)
            }
        }
       // .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("Settings")
        .onAppear{
            self.firstName = userViewModel.user.firstName//userRepo.
            self.lastName = userViewModel.user.firstName//.userRepo.user.lastName
            self.userName = userViewModel.user.userName//userRepo.
            print("In the on appear this is the user \(userViewModel.user)")
        }
    }
    
    
    //#Preview {
    //    SettingsView()
    //}
}
