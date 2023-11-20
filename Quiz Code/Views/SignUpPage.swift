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
    
 //   @EnvironmentObject var viewModel: UserViewModel
    let dateFormatter = DateFormatter()
    
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
                    }
                }
                .frame(maxHeight: 375)
                .cornerRadius(20.0)
                .padding()
                Button(action: {
//                    viewModel.user = User(firstName: firstName, lastName: lastName, birthday: birthday)
                    showHomeView.toggle()
                }, label: {
                    Text("Continue")
                }).padding()
                    .fullScreenCover(isPresented: $showHomeView) {
                        HomePage(user: User(firstName: firstName, lastName: lastName, birthday: birthday))
                    }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white)
        }
    }
}


#Preview {
    SignUpPage()
}
