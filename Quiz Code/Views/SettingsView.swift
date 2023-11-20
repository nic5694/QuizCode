//
//  SettingsView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userViewModel:UserViewModel
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @EnvironmentObject var scoreViewModel: ScoreViewModel
    @State var firstName: String
    @State var lastName: String
    @State var birthday: Date
    @State private var showingDatePickerView = false
    
    init(firstName: String, lastName: String, birthday: Date) {
        _firstName = State(initialValue: firstName)
        _lastName = State(initialValue: lastName)
        _birthday = State(initialValue: birthday)
        self.showingDatePickerView = showingDatePickerView
    }
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
        VStack{
            TitleHeader(text: "Settings")
            Form{
                Section(header: Text("User Information")){
                    LabeledContent{
                        TextField("John", text: $firstName)
                    } label: {
                        Text("First Name: ")
                    }.padding()
                    LabeledContent{
                        TextField("Dhoe", text: $lastName)
                    } label: {
                        Text("Last Name: ")
                    }.padding()
                    LabeledContent{
                        Text(birthday, style: .date).onTapGesture {
                            showingDatePickerView.toggle()
                        }.sheet(isPresented: $showingDatePickerView) {
                            DatePickerView()
                                .presentationDetents([.height(300)])
                        }
                    } label: {
                        Text("Birthday :")
                    }.padding()
                    HStack(alignment: .center){
                        Spacer()
                        Button(action: {
                            if(userViewModel.user.firstName != firstName || userViewModel.user.lastName != lastName || userViewModel.user.birthday != birthday){
                                let updatedUser = User(firstName: firstName, lastName: lastName, birthday: birthday)
                                userViewModel.user = updatedUser
                                userViewModel.updateUseR(user: updatedUser)
                            }
                        }, label: {
                            Text("Save Changes")
                        })
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: 500, maxHeight: 600)
            .cornerRadius(20.0)
            .padding()
          //  ScrollView {
                
                    List{
                        ForEach(scoreViewModel.scoreList, id: \.id) { item in
                            ScrollListItemComponent(text: "Quiz: \(item.subject) \(item.grade)")
                        }.onDelete(perform: { indexSet in
                            
                            deleteItems(at: indexSet)
                        })
                       // .onDelete.onDelete( perform: deleteItems)
                    }
                  
                
          //  }
            .frame(maxWidth: 500)
            .background(Color(.white))
            .cornerRadius(20.0)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }

}


//#Preview {
//    SettingsView()
//}
