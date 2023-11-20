//
//  Score.swift
//  Quiz Code
//
//  Created by nic on 2023-11-20.
//
//import FirebaseFirestore
import FirebaseFirestoreSwift

struct Score: Identifiable, Codable {
    @DocumentID var id: String?
    var subject: String = ""
    var grade: String = ""
    init() {}
    init(subject: String, grade: String) {
        self.subject = subject
        self.grade = grade
    }
}
