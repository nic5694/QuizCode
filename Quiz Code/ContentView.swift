//
//  ContentView.swift
//  Quiz Code
//
//  Created by nic on 2023-10-02.
//

import SwiftUI

struct ContentView: View {
 //   @StateObject var userViewModel = UserViewModel()
    @StateObject var userViewModel = UserViewModel(user: User(firstName: "", lastName: "", birthday: Date.now))
//    init(){
//        _userViewModel = StateObject(wrappedValue: UserViewModel())
//    }
    var body: some View {
        VStack {
            SignUpPage()
                .environmentObject(userViewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
