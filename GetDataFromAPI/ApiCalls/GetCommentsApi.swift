//
//  GetCommentsApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 16.11.2021.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

class GetCommentsApi {
    func getComments(from url: String, completion: @escaping ([Comment]?, HTTPErrors?) -> ()) {
        let task = URLSession.createTask(with: url, completion: completion)
        task.resume()
    }
}
