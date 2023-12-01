//
//  UserViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Combine
import Foundation
class UserViewModel: ObservableObject {
    @Published var user : User
    @Published var userList = [User]()
    @Published var tobeUpdatedUser = User(firstName: "", lastName: "", userName: "")
    @Published var userRepo: UserRepository = UserRepository.shared
   
    private var cancellables: Set<AnyCancellable> = []
    init() {
        
        self.user = User(firstName: "", lastName: "", userName: "")

            userRepo.$user
                .sink { [weak self] newUser in
                    print("This should be the new user in the userViewModel \(newUser)")
                    self?.user = newUser
                }
                .store(in: &cancellables)
    }
    func addUser(user: User){
        self.user = user
        self.userRepo.add(user)
    }
    func updateUser(_ user:User){
        self.user = user
        self.userRepo.update(user)
    }
}
