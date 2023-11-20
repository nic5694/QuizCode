//
//  UserRepository.swift
//  Quiz Code
//
//  Created by nic on 2023-11-20.
//
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
class UserRepository: ObservableObject {
    static var shared = UserRepository()
    @Published var user: User
    private let path = "users"
    private let userId = "XIfDysYpAcIkwmiqACO6"
    private let store = Firestore.firestore()
    @Published var tempList: [User] = []
    init() {
       self.user  = User(firstName: "", lastName: "", userName: "")
        //get()
        getBasicUser()
       // getAll()
    }
//    func getBasicUser() {
//      //  if let userID = Auth.auth().currentUser?.uid {
//        
//            let usersRef = store.collection(path)
//
//        usersRef.document(self.userId).addSnapshotListener { documentSnapshot, error in
//                if let error = error {
//                    print("Error getting user: \(error.localizedDescription)")
//                    return
//                }
//
//                guard let documentSnapshot = documentSnapshot else {
//                    print("No snapshot data available.")
//                    return
//                }
//
//                do {
//                    self.user = try documentSnapshot.data(as: User.self)
//                } catch {
//                    print("Error decoding user: \(error.localizedDescription)")
//                }
//            }
//     //   }
//    }
    func getBasicUser() {
        let usersRef = store.collection(path)
        let query = usersRef.whereField("firstName", isEqualTo: "John")
        
        query.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            guard let document = querySnapshot?.documents.first else {
                print("No documents found.")
                return
            }

            do {
                self.tempList.append(try document.data(as: User.self))
                print("USER: \(self.user)")
            } catch {
                print("Error decoding user: \(error)")
            }
        }
    }

//    func getBasicUser(){
//        let usersRef = store.collection(path)
//        let query  = usersRef.whereField("firstName", isEqualTo: "John")
//        query.getDocuments() {(querySnapshot, err)in
//            if let err = err {
//                  print("Error getting documents: \(err)")
//                } else {
//                  for document in querySnapshot!.documents {
//                      do {
//                          self.user = try document.data(as: User.self)
//                      }
//                      catch{
//                          fatalError("Failed to get user")
//                      }
//                  }
//                }
//
//            
//        }
//        print("USER: \(self.user)")
//    }
    func get() {
        store.collection(path)
            .order(by: FieldPath.documentID())
            .limit(to: 1)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error getting user: \(error.localizedDescription)")
                    return
                }
                
                guard let snapshot = snapshot else {
                    print("No snapshot data available.")
                    return
                }
                
                do {
                    if let userDocument = snapshot.documents.first {
                       // self.user = try userDocument.data(as: User.self)
                    }
                } catch {
                    print("Error decoding user: \(error.localizedDescription)")
                }
            }
    }
    func getAll(){
//       @State var tempList: [User] = []
        store.collection(path).addSnapshotListener{snapshot, error in
            if let error  = error {
                print(error)
                return
            }
            self.tempList = snapshot?.documents.compactMap {
                    try? $0.data(as: User.self)
            } ?? [] //if it cannot get it, it will return an empty array
        }
        print(self.tempList)
        //user = self.$tempList[0]
    }

    func add(_ user: User){
        do {
            _ = try store.collection(path).addDocument(from: user)
        }catch {
            
        }
    }
    func update(_ user: User) {
        print("This is the id i am receiving in the updateeeeee: \(user.id)")
       // if let documentId = user.id {
            store.collection(path).document("wvpArqTGxhLmgaYOkuk8").setData(["firstName": user.firstName, "lastName": user.lastName, "userName": user.userName], merge: true)
     //   }
    }


}
