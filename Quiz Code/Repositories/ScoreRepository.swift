//
//  ScoreRepository.swift
//  Quiz Code
//
//  Created by nic on 2023-11-20.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
class ScoreRepository: ObservableObject {
    static var shared = ScoreRepository()
    @Published var list: [Score] = []
    private let path = "scores"
    private let store = Firestore.firestore()
    
    func getAll(){
        store.collection(path).addSnapshotListener{snapshot, error in
            if let error  = error {
                print(error)
                return
            }
            self.list = snapshot?.documents.compactMap {
                try? $0.data(as: Score.self)
            } ?? [] //if it cannot get it, it will return an empty array
        }
    }
    func add(_ score: Score){
        do {
            _ = try store.collection(path).addDocument(from: score)
        }catch {
            fatalError("Adding a todo failed")
        }
    }
    func update(_ score: Score) {
        if let documentId = todo.id {
            store.collection(path).document(documentId).setData(["grade": score.grade, "subject": score.subject], merge: true)
        }
    }
    func delete(_ score: Score) {
        if let documentId = score.id {
            store.collection(path).document(documentId).delete{
                error in
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    
}
