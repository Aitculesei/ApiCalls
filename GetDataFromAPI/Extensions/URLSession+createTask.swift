//
//  URLSession+createTask.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 16.11.2021.
//

import Foundation

extension URLSession {
    static func createTask<DataType: Codable>(with url: String, completion: @escaping ([DataType]) -> ()) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            // HERE WE MAKE SURE THAT WE GET SOME DATA BACK
            guard let data = data, error == nil else {
                print("Something went wrong in creating a data task.")
                return
            }

            var dataResults: [DataType]?
            do {
                dataResults = try JSONDecoder().decode([DataType].self, from: data)
            }
            catch {
                print("Failed to convert data: \(error.localizedDescription)")
            }

            guard let json = dataResults else {
                return
            }
            
            DispatchQueue.main.async {
                completion(json)
            }
        })
    }
    
    static func createTask<DataType: Codable>(with request: URLRequest, completion: @escaping ([DataType]) -> ()) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            // HERE WE MAKE SURE THAT WE GET SOME DATA BACK
            guard let data = data, error == nil else {
                print("Something went wrong in creating a data task.")
                return
            }

            var dataResults: DataType?
            do {
                dataResults = try JSONDecoder().decode(DataType.self, from: data)
            }
            catch {
                print("Failed to convert data: \(error.localizedDescription)")
            }

            guard let json = dataResults else {
                return
            }
            
            DispatchQueue.main.async {
                completion([json])
            }
        })
    }
}
