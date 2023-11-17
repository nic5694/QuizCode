//
//  QuizAcessService.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Foundation

class QuizAcessService {
    func getQuestions(quantity: Int, category: String, difficulty: String, _ completion: @escaping([Question]) -> ()) {
        // Construct the URL with query parameters
        let urlString = "https://quizapi.io/api/v1/questions"
        let queryParams = [
            "category": category,
            "limit": String(quantity),
            "difficulty": difficulty
        ]
        let urlWithParams = urlString + "?" + queryParams.map { "\($0.key)=\($0.value)" }.joined(separator: "&")

        // Construct the headers
        let headers = [
            "Content-Type": "application/json",
            "X-Api-Key": ProcessInfo.processInfo.environment["API_KEY"] ?? ""
        ]
        print("Inside the get Questions before the .fetchData")
        Bundle.main.fetchData(url: urlWithParams, model: Question.self, headers: headers) { data in
            completion(data)
            print("Data \(data)")
        } failure: { error in
            print("ERROR: \(error)")
        }
    }
}

//
//import Foundation
//class QuizAcessService {
//    func getQuestions(quantity: Int, category: String, difficulty: String, _ completion: @escaping(Question) -> ()){
//        let headers = [
//            "Content-Type": "application/json",
//            "X-Api-Key": (ProcessInfo.processInfo.environment["API_KEY"] ?? "") as String,
//            "category":category,
//            "limit":quantity as Int,
//            "difficulty": difficulty] as [String : Any]
//        Bundle.main.fetchData(url: "https://quizapi.io/api/v1/questions -G", model: Question.self, headers: headers) { data in
//            completion(data)
//        } failure: { error in
//            print(error)
//        }
//    }
//}
