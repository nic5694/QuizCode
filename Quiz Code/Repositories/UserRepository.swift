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
    private let userId = "eWoZKhWGLCyUNLUEVUjN"
    private let store = Firestore.firestore()
    @Published var tempList: [User] = []
    init() {
       self.user  = User(firstName: "", lastName: "", userName: "")
        print("THis is before the user is assigned \(self.user)")
        getDocumentById(userId)
        print("This is after the user is assigned \(self.user)")
    }

    
    func getDocumentById(_ documentId: String){ //-> User {
        store.collection(path).document(documentId)
            .getDocument { document, error in
                if let error = error {
                    print("Error getting document: \(error.localizedDescription)")
                    return
                }
                
                guard let document = document, document.exists else {
                    print("Document with ID \(documentId) does not exist.")
                    return
                }
                
                do {
                    self.user  = try document.data(as: User.self)
                    print("This is tmep user: \(self.user)")
                    print("Successfully retrieved user: \(self.user)")
                } catch {
                    print("Error decoding user: \(error.localizedDescription)")
                }
            }
    }

    func add(_ user: User) {
        var documentReference: DocumentReference?  // Declare documentReference outside the closure
        do {
            documentReference = try store.collection(path).addDocument(from: user) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else if let documentReference = documentReference {
                    print("Document added with ID: \(documentReference.documentID)")
                }
            }
        } catch {
            print("Error encoding user: \(error)")
            
        }
    }
    func update(_ user: User) {
        store.collection(path).document(self.userId).setData(["firstName": user.firstName, "lastName": user.lastName, "userName": user.userName], merge: true)
    }


}
