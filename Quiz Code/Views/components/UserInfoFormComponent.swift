//
//  UserInfoFormComponent.swift
//  Quiz Code
//
//  Created by nic on 2023-10-16.
//

import SwiftUI

struct UserInfoFormComponent: View {
    @EnvironmentObject var viewModel : QuizCodeViewModel
    @State public var firstName: String
    @State public var lastName: String
    @State public var birthday: Date
    @State private var showingDatePickerView = false
    public func saveObject() -> Void {
//        var myDict : [String: Any] = [:]
//        myDict["firstName"] = $firstName
//        myDict["lastName"] = $lastName
//        myDict["birthday"] = $birthday
//        return myDict
        viewModel.user = User(firstName: firstName, lastName: lastName, birthday: birthday)
    }
    var body: some View {
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
            }
        }
        .frame(maxHeight: 300)
        .cornerRadius(20.0)
        .padding()
    }
}

#Preview {
    UserInfoFormComponent(firstName: "", lastName: "", birthday: Date())
}
