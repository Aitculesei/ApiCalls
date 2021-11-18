//
//  GetAlbumsApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 16.11.2021.
//

import Foundation

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}

class GetAlbumsApi {
    func getAlbums(from url: String, completion: @escaping ([Album]) -> ()) {
        let task = URLSession.createTask(with: url, completion: completion)
        task.resume()
    }
}
