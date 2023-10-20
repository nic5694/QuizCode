//
//  SettingsView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel:QuizCodeViewModel
    @State public var firstName: String
    @State public var lastName: String
    @State public var birthday: Date
    @State private var showingDatePickerView = false
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
                        }.sheet(isPresented: $showingDatePickerView, onDismiss:{
                            self.birthday = viewModel.user.birthday!
                        }) {
                            DatePickerView()
                                .presentationDetents([.height(300)])
                        }
                    } label: {
                        Text("Birthday :")
                    }.padding()
                    HStack(alignment: .center){
                        Spacer()
                        Button(action: {
                            if(viewModel.user.firstName != firstName || viewModel.user.lastName != lastName || viewModel.user.birthday != birthday){
                                viewModel.user = User(firstName: firstName, lastName: lastName, birthday: birthday)
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
                ForEach(viewModel.scrollListItem, id: \.text) { item in
                    item
                }
            }
            .frame(maxWidth: 500)
            .background(Color(.white))
            .cornerRadius(20.0)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGreen"))
    }
}

#Preview {
    SettingsView(firstName: "Nicholas", lastName: "Martoccia", birthday: Date())
}