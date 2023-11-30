//
//  SignUpPage.swift
//  Quiz Code
//
//  Created by nic on 2023-10-02.
//

import SwiftUI

struct SignUpPage: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthday: Date = Date.now
    @State private var showingDatePickerView = false
    @State private var isLinkActive = false
    @State private var showHomeView = false
    @State private var username: String = ""
    
    @EnvironmentObject var userViewModel: UserViewModel
    let dateFormatter = DateFormatter()
    init(){
//        self.firstName = viewModel.user.firstName
            //   self.lastName = v
    }
    var body: some View {
        NavigationStack{
            VStack {
                TitleHeader(text: "Welcome to Quiz Code")
                SupportingTitleText(text: "Please enter your information below")
                Form{
                    Section(header: Text("User Information")){
                        LabeledContent{
                            TextField("superSmart5694", text: $username)
                        } label: {
                            Text("Username: ")
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
                        }.padding()
                    }
                }
            }
            .frame(maxHeight: 450)
            .cornerRadius(20.0)
            .padding()
            Button(action: {
                /*userViewModel.addUser(user: User(firstName: firstName, lastName: lastName, userName: username))*/
                showHomeView.toggle()
            }, label: {
                Text("Continue")
            }).padding()
                .fullScreenCover(isPresented: $showHomeView) {
                    HomePage(user: User(firstName: firstName, lastName: lastName, userName: username))
                }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white)
    }
}



#Preview {
    SignUpPage()
}
