////
////  User.swift
////  Quiz Code
////
////  Created by nic on 2023-10-05.
////
//
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var userName: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case userName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        userName = try container.decode(String.self, forKey: .userName)
    }

   init(firstName: String, lastName: String, userName: String) {
       self.firstName = firstName
       self.lastName = lastName
       self.userName = userName
   }
    
}
