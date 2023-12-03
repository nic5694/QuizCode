//
//  UserInformationFormView.swift
//  Quiz Code
//
//  Created by nic on 2023-12-02.
//

import SwiftUI

struct UserInformationFormView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isPresented: Bool
    @State private var firstName: String
    @State private var lastName: String
    @State private var userName: String

    init(userViewModel: UserViewModel, isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self._firstName = State(initialValue: userViewModel.user.firstName)
        self._lastName = State(initialValue: userViewModel.user.lastName)
        self._userName = State(initialValue: userViewModel.user.userName)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit User Information")) {
                    LabeledContent {
                        TextField("user123", text: $userName)
                    } label: {
                        Text("UserName: ")
                    }.padding()
                    LabeledContent {
                        TextField("John", text: $firstName)
                    } label: {
                        Text("First Name: ")
                    }.padding()
                    LabeledContent {
                        TextField("Dhoe", text: $lastName)
                    } label: {
                        Text("Last Name: ")
                    }.padding()
                }
            }
//            .navigationBarTitle("Edit User Information")
            .navigationBarItems(trailing: Button("Done") {
                userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: userName))
                isPresented = false
            })
        }
    }
}
//#Preview {
//    UserInformationFormView(isPresented: .constant(true))
//}
