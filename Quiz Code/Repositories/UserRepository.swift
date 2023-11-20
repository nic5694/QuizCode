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
    @Published var user: User?
    private let path = "users"
    private let store = Firestore.firestore()
    @Published var tempList: [User] = []
    init() {
        get()
        print(user)
    }
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
                        self.user = try userDocument.data(as: User.self)
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
        //user = self.$tempList[0]
    }

    func add(_ user: User){
        do {
            _ = try store.collection(path).addDocument(from: user)
        }catch {
            fatalError("Adding a user failed")
        }
    }
    func update(_ user: User) {
        if let documentId = user.id {
            store.collection(path).document(documentId).setData(["firstName": user.firstName, "lastName": user.lastName, "bithday": user.birthday], merge: true)
        }
    }


}
