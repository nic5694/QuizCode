//
//  UserViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Foundation
class UserViewModel: ObservableObject {
    @Published var user : User
    init(user: User) {
        self.user = user
    }
}
