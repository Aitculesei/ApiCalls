//
//  GetDadjokeApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 15.11.2021.
//

import Foundation

struct DadJoke: Codable {
    let id: String
    let joke: String
    let status: Int
}

class GetDadjokeApi {
    func getDadjokes(from url: String, completion: @escaping ([DadJoke]) -> ()) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Accept" : "application/json"
        ]
        
        let task = URLSession.createTask(with: request, completion: completion)
        task.resume()
    }
}
