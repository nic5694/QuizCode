//
//  UserViewModel.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Combine
class UserViewModel: ObservableObject {
    @Published var user : User
    @Published var userList = [User]()
    @Published var tobeUpdatedUser = User(firstName: "", lastName: "", userName: "")
    @Published var userRepo: UserRepository = UserRepository.shared
    private var cancellables: Set<AnyCancellable> = []
   
    
    init(/*user: User*/) {
       
       // self.user = User(firstName: userRepo.user?.firstName!, lastName: userRepo.user?.lastName!, userName: userRepo.user?.userName!)
        self.user = User(firstName: "", lastName: "", userName: "")
//        self.user = User()
//               userRepo.$user
//                   .compactMap { $0 } // Ignore nil values
//                   .sink { [weak self] newUser in
//                       self?.user = newUser
//                   }
//                   .store(in: &cancellables)
//        self.user = userRepo.user ?? User()
        

        //        userRepo.$user
//               .sink { [weak self] user in
//                   // Unwrap the optional user before assigning
//                   if let user = user {
//                       self?.user = user
//                   }
//               }
//               .store(in: &cancellables)
//        self.userRepo.$user
//            .assign(to: \.user, on: self)
//            .store(in: &cancellables)
        
//        self.user = userRepo.$user
//            .assign(to: \.user, on: self)
//            .store(in: &cancellables)
        self.userRepo.$tempList
            .assign(to: \.userList, on: self)
            .store(in: &cancellables)
//        self.user = self.$userList[0]
        //self.user = self.$userList
//        if let repoUser = userRepo.user {
//            self.user = repoUser
//        }
      //  print("This is the userrrrrr \(self.userList[0])")
        
//            print("userrrrrr from repo: \(self.userRepo.tempList[0])")
        
    }
    func addUser(user: User){
        self.user = user
        userRepo.add(user)
    }
    func updateUser(){
        userRepo.update(tobeUpdatedUser)
    }
}
