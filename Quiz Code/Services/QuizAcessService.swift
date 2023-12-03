//
//  QuizAcessService.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Foundation

class QuizAcessService {
    func getQuestions(quantity: Int, category: String, difficulty: String, tags: String = "", _ completion: @escaping([Question]) -> ()) {
        // Construct the URL with query parameters
        let urlString = "https://quizapi.io/api/v1/questions"
        let queryParams =  {
            if(tags != ""){
                return [
                    "limit": String(quantity),
                    "difficulty": difficulty,
                    "tags": tags
                ]
            } else {
                return [
                    "category": category,
                    "limit": String(quantity),
                    "difficulty": difficulty
                ]
            }
        }
        let urlWithParams = urlString + "?" + queryParams().map { "\($0.key)=\($0.value)" }.joined(separator: "&")

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
