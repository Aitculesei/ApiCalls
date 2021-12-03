//
//  Repository.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 18.11.2021.
//

import Foundation

// For API calls
struct Repository: Repo {
//    func apiCalls() {
//        GetPostsApi().getPosts(from: Constants.postsURL) { $0.printData() }
//        GetCommentsApi().getComments(from: Constants.commentsURL) { $0.printData() }
//    //        GetAlbumsApi().getAlbums(from: albumsURL) { $0.printData() }
//        GetDadjokeApi().getDadjokes(from: Constants.dadjokesURL) { dadjokeJSON in
//            dadjokeJSON.printData()
//        }
//
//    }
    
    func getUsers(at completion: @escaping ([User]?) -> ()) {
        GetUsersApi().getUsers(from: C.APICallURL.users) { result in

            // First method
///            switch result {
///            case .success(let receivedUsers):
///                completion(receivedUsers)
///            case .failure(let error):
///                print(error.localizedDescription)
///            }
            
            // Second method
            if case .success(let users) = result {
                completion(users)
            } else if case .failure(let error) = result {
                print(error.localizedDescription)
            }
            // MARK: - QUESTION?
//            if let users = try? result.get() {
//                completion(users)
//            } else {
//
//            }
        }
    }
}

protocol Repo {
    func getUsers(at completion: @escaping ([User]?) -> ())
}

extension Repo {
    
}
