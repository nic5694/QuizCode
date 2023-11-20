//
//  UserViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Combine
class UserViewModel: ObservableObject {
    @Published var user : User
   // @Published var userList: [User] = []
    @Published var userRepo: UserRepository = UserRepository.shared
    private var cancellables: Set<AnyCancellable> = []
    
    init(user: User) {
        self.user = user
        
//        self.userRepo.$tempList
//            .assign(to: \.user, on: self)
//            .store(in: &cancellables)
//        UserRepository.shared.$tempList
//                    .assign(to: \.userList, on: self)
//                    .store(in: &cancellables)
//        if let repoUser = userRepo.user {
//            self.user = repoUser
//        }
        
    }
    func addUser(user: User){
        userRepo.add(user)
    }
    func updateUseR(user: User){
        userRepo.update(user)
    }
}
