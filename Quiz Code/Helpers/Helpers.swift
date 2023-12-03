//
//  Helpers.swift
//  Quiz Code
//
//  Created by nic on 2023-11-12.
//

import Foundation
import FirebaseFirestore
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not load \(file) from bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not extract data from \(file)")
        }

        let decoder = JSONDecoder()

        do {
            // Use the [T].self syntax to decode an array of T
            let loadedData = try decoder.decode([T].self, from: data)
            return loadedData as! T
        } catch {
            fatalError("Could not decode \(file) from bundle. Error: \(error)")
        }
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, headers: [String: String]? = nil, completion: @escaping ([T]) -> (), failure: @escaping (Error) -> ()) {
            guard let url = URL(string: url) else {
                failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            // Add headers to the request if provided
            if let headers = headers {
                for (key, value) in headers {
                    request.addValue(value, forHTTPHeaderField: key)
                }
            }

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    if let error = error {
                        failure(error)
                    }
                    return
                }

                do {
                    // Use [T].self syntax to decode an array of T
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                    completion(decodedData)
                } catch {
                    failure(error)
                }
            }.resume()
        }
    }
