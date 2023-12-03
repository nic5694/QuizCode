//
//  UserInformationFormView.swift
//  Quiz Code
//
//  Created by nic on 2023-12-02.
//

import SwiftUI

//struct UserInformationFormView: View {
//    @EnvironmentObject var userViewModel: UserViewModel
//    @Binding var isPresented: Bool
//    @State private var firstName: String
//    @State private var lastName: String
//    @State private var userName: String
//
//    init(userViewModel: UserViewModel, isPresented: Binding<Bool>) {
//        self._isPresented = isPresented
//        self._firstName = State(initialValue: userViewModel.user.firstName)
//        self._lastName = State(initialValue: userViewModel.user.lastName)
//        self._userName = State(initialValue: userViewModel.user.userName)
//    }
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Edit User Information")) {
//                    LabeledContent {
//                        TextField("user123", text: $userName)
//                    } label: {
//                        Text("UserName: ")
//                    }.padding()
//                    LabeledContent {
//                        TextField("John", text: $firstName)
//                    } label: {
//                        Text("First Name: ")
//                    }.padding()
//                    LabeledContent {
//                        TextField("Dhoe", text: $lastName)
//                    } label: {
//                        Text("Last Name: ")
//                    }.padding()
//                }
//            }
////            .navigationBarTitle("Edit User Information")
//            .navigationBarItems(trailing: Button("Done") {
//                userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: userName))
//                isPresented = false
//            })
//        }
//    }
//}
////#Preview {
////    UserInformationFormView(isPresented: .constant(true))
////}


//import SwiftUI

struct UserInformationFormView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var isPresented: Bool
    @State private var firstName: String
    @State private var lastName: String
    @State private var userName: String
    @State private var showAlert = false
    @State private var alertMessage = ""

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
            .navigationBarItems(trailing: Button("Done") {
                if isValidInput() {
                    userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: userName))
                    isPresented = false
                } else {
                    showAlert = true
                }
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    func isValidInput() -> Bool {
        // Check if username, first name, and last name are not empty
        guard !userName.isEmpty, !firstName.isEmpty, !lastName.isEmpty else {
            alertMessage = "Please fill in all fields."
            return false
        }
        // Check for the absence of special characters in username, first name, and last name
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\",.<>/?`~")
        if userName.rangeOfCharacter(from: specialCharacterSet) != nil ||
            firstName.rangeOfCharacter(from: specialCharacterSet) != nil ||
            lastName.rangeOfCharacter(from: specialCharacterSet) != nil {
            alertMessage = "Username, first name, and last name cannot contain special characters."
            return false
        }
        return true
    }
}

// #Preview {
//     UserInformationFormView(isPresented: .constant(true))
// }
