//
//  GetPostsApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 15.11.2021.
//

import Foundation

struct Posts: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class GetPostsApi {
    func getPosts(from url: String, completion: @escaping ([Posts]?, HTTPErrors?) -> ()) {
        let task = URLSession.createTask(with: url, completion: completion)
        task.resume()
    }
}
