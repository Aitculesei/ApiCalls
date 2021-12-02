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
    
    func getUsers(at completion: @escaping ([Users]?) -> ()) {
        GetUsersApi().getUsers(from: Constants.usersURL) { users, error in
            print("USERS in Repo: \(users)")
            guard error == nil else {
                switch error {
                case .noData: print("No user data!")
                case .badRequest: print("Bad getUsers request!")
                case .badData: print("Bad user data!")
                case .none: print("Some wierdo error!")
                }
                return
            }
            completion(users)
        }
    }
}

protocol Repo {
    
    func getUsers(at completion: @escaping ([Users]?) -> ())
}

extension Repo {
    
}

// MARK: - Constants

struct Constants {
    static let postsURL = "https://jsonplaceholder.typicode.com/posts"
    static let usersURL = "https://jsonplaceholder.typicode.com/users"
    static let commentsURL = "https://jsonplaceholder.typicode.com/comments"
    static let albumsURL = "https://jsonplaceholder.typicode.com/albums"
    static let dadjokesURL = "https://icanhazdadjoke.com/"
}