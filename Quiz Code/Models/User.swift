//
//  User.swift
//  Quiz Code
//
//  Created by nic on 2023-10-05.
//

import SwiftUI
import FirebaseFirestoreSwift
struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var birthday: Date
    init(firstName: String, lastName: String, birthday: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
    }
}
