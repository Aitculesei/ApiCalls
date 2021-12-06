//
//  GetUsersApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 15.11.2021.
//

import Foundation

struct APIUser: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: CompanyDetails
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Coordinates
}

struct Coordinates: Codable {
    let lat: String
    let lng: String
}

struct CompanyDetails: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

class GetUsersApi {
    func getUsers(from url: String, completion: @escaping (Result<[APIUser]?, HTTPErrors>) -> ()) {
        let task = URLSession.createTask(with: url, completion: completion)
        task.resume()
    }
}
