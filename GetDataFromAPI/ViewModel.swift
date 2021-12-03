//
//  ViewModel.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 18.11.2021.
//

import UIKit

class ViewModel {
    private let repo = Repository()
    
    func getUsersFromApi(completion: @escaping ([User]?, [(String,String)]) -> ()) {
        repo.getUsers { users in
            guard let result = users else {
                return
            }
            
            var usersInfo: [(String, String)] = []
            for user in result {
                usersInfo.append((user.name, user.email))
            }
            completion(users, usersInfo)
        }
    }
}
