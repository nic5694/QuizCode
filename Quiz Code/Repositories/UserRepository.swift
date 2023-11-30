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
      //  self.user = getDocumentById(userId)
        getDocumentById(userId)
        print("This is after the user is assigned \(self.user)")
//        get()
//       // getBasicUser()
//        print("This is the user: \(self.user)")
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
//    func getBasicUser() {
//        let usersRef = store.collection(path)
//        let query = usersRef.whereField("firstName", isEqualTo: "John")
//        
//        query.getDocuments() { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting documents: \(error)")
//                return
//            }
//
//            guard let document = querySnapshot?.documents.first else {
//                print("No documents found.")
//                return
//            }
//
//            do {
//                self.tempList.append(try document.data(as: User.self))
//                print("USER: \(self.user)")
//            } catch {
//                print("Error decoding user: \(error)")
//            }
//        }
//    }

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
                        self.user = try userDocument.data(as: User.self)
                    }
                } catch {
                    print("Error decoding user: \(error.localizedDescription)")
                }
            }
    }
    
    func getDocumentById(_ documentId: String){ //-> User {
   //     var user: User
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
            //  return user
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

    func add(_ user: User) {
        var documentReference: DocumentReference?  // Declare documentReference outside the closure
        do {
            documentReference = try store.collection(path).addDocument(from: user) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else if let documentReference = documentReference {
                    print("Document added with ID: \(documentReference.documentID)")
//                    self.getDocumentById(documentReference.documentID)
                    // Here, you can use documentReference.documentID as needed
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
