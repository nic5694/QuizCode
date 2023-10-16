//
//  User.swift
//  Quiz Code
//
//  Created by nic on 2023-10-05.
//

import SwiftUI
struct User {
    var firstName: String?
    var lastName: String?
    var birthday: Date?
    init(){}
    init(firstName: String? = nil, lastName: String? = nil, birthday: Date? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
    }
}
