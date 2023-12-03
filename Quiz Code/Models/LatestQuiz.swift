//
//  LatestTest.swift
//  Quiz Code
//
//  Created by nic on 2023-12-02.
//

import Foundation
struct LatestQuiz: Codable{
    let selectedDifficulty: String
    let numberOfQuestions: Int
    let name: String
//    func saveToUserDefaults(key: String) {
//           do {
//               let data = try JSONEncoder().encode(self)
//               UserDefaults.standard.set(data, forKey: key)
//           } catch {
//               print("Error encoding LatestQuiz: \(error)")
//           }
//       }
//
//       static func loadFromUserDefaults(key: String) -> LatestQuiz? {
//           if let data = UserDefaults.standard.data(forKey: key) {
//               do {
//                   return try JSONDecoder().decode(LatestQuiz.self, from: data)
//               } catch {
//                   print("Error decoding LatestQuiz: \(error)")
//               }
//           }
//           return nil
//       }
//
    
//    init(selectedDifficulty: String, numberOfQuestions: Int, name: String) {
//        self.selectedDifficulty = selectedDifficulty
//        self.numberOfQuestions = numberOfQuestions
//        self.name = name
//    }
}
