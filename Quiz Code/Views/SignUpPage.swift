//
//  SignUpPage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-02.
//
//

import SwiftUI

struct SignUpPage: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showHomeView = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .fill(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to Quiz Code").titleHeaderOnWhiteBackgroundStyle()
                    Text("Please enter your information below").supportingTitleTextOnWhiteBackgroundStyle()
                    Form {
                        Section(header: Text("User Information")) {
                            LabeledContent {
                                TextField("superSmart5694", text: $username)
                            } label: {
                                Text("Username: ")
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
                            HStack{
                                Spacer()
                                Button(action: {
                                    if isValidInput() {
                                        userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: username))
                                        showHomeView.toggle()
                                    } else {
                                        showAlert = true
                                    }
                                }, label: {
                                    Text("Continue")
                                })
                                .padding()
                                .fullScreenCover(isPresented: $showHomeView) {
                                    HomePage()
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .frame(maxHeight: 540)
                .cornerRadius(20.0)
                .padding()
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    func isValidInput() -> Bool {
        if username.isEmpty || firstName.isEmpty || lastName.isEmpty {
            alertMessage = "Please fill in all fields."
            return false
        }
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\",.<>/?`~")
                if username.rangeOfCharacter(from: specialCharacterSet) != nil ||
                   firstName.rangeOfCharacter(from: specialCharacterSet) != nil ||
                    lastName.rangeOfCharacter(from: specialCharacterSet) != nil {
                    alertMessage = "Username, first name, and last name cannot contain special characters."
                    return false
                }
        return true
    }
}



#Preview {
    SignUpPage()
}

