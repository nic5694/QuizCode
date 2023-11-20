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
    @State public var firstName: String = ""
    @State public var lastName: String = ""
    @State public var birthday: Date = Date.now
    @State private var showingDatePickerView = false
    
    init() {
//        _firstName = State(initialValue: userViewModel.user.firstName)
//        _lastName = State(initialValue: userViewModel.user.lastName)
//        _birthday = State(initialValue: userViewModel.user.birthday)
        self.showingDatePickerView = showingDatePickerView
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
                                userViewModel.user = User(firstName: firstName, lastName: lastName, birthday: birthday)
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
            ScrollView {
                ForEach(scoreViewModel.scoreList, id: \.text) { item in
                    Text("Quiz: \(item.subject) \(item.score)")
                }
            }
            .frame(maxWidth: 500)
            .background(Color(.white))
            .cornerRadius(20.0)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    SettingsView()
}
