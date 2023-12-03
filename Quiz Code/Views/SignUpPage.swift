////
////  SignUpPage.swift
////  Quiz Code
////
////  Created by nic on 2023-10-02.
////
//
//import SwiftUI
//
//struct SignUpPage: View {
//    
//    @State private var firstName: String = ""
//    @State private var lastName: String = ""
//    @State private var birthday: Date = Date.now
//    @State private var showingDatePickerView = false
//    @State private var isLinkActive = false
//    @State private var showHomeView = false
//    @State private var username: String = ""
//    
//    @EnvironmentObject var userViewModel: UserViewModel
//    let dateFormatter = DateFormatter()
//    init(){
////        self.firstName = viewModel.user.firstName
//            //   self.lastName = v
//        
//    }
//    var body: some View {
//        NavigationStack{
//            VStack {
//                Text("Welcome to Quiz Code").titleHeaderOnWhiteBackgroundStyle()
//                Text("Please enter your information below").supportingTitleTextOnWhiteBackgroundStyle()
//                Form{
//                    Section(header: Text("User Information")){
//                        LabeledContent{
//                            TextField("superSmart5694", text: $username)
//                        } label: {
//                            Text("Username: ")
//                        }.padding()
//                        LabeledContent{
//                            TextField("John", text: $firstName)
//                        } label: {
//                            Text("First Name: ")
//                        }.padding()
//                        LabeledContent{
//                            TextField("Dhoe", text: $lastName)
//                        } label: {
//                            Text("Last Name: ")
//                        }.padding()
//                    }
//                }
//            }
//            .frame(maxHeight: 450)
//            .cornerRadius(20.0)
//            .padding()
//            Button(action: {
//                userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: username))
//                    showHomeView.toggle()
//            }, label: {
//                Text("Continue")
//            }).padding()
//                .fullScreenCover(isPresented: $showHomeView) {
//                    HomePage(/*user: User(firstName: firstName, lastName: lastName, userName: username)*/)
//                }
//        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.white)
//           
//
//    }
//        
//       
//}
//
//
//
//#Preview {
//    SignUpPage()
//}

import SwiftUI

struct SignUpPage: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showHomeView = false

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
                                    userViewModel.updateUser(User(firstName: firstName, lastName: lastName, userName: username))
                                    showHomeView.toggle()
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
    }
}

#Preview {
    SignUpPage()
}

