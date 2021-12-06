//
//  Repository.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 18.11.2021.
//

import Foundation

struct User {
    let name: String
    let email: String
    let address: String
    let phone: String
    let website: String
    let company: String
    init(apiUser: APIUser) {
        name = apiUser.name
        email = apiUser.email
        address = "\(apiUser.address.street) | \(apiUser.address.suite) | \(apiUser.address.city) | \(apiUser.address.zipcode)"
        phone = apiUser.phone
        website = apiUser.website
        company = "\(apiUser.company.name) | \(apiUser.company.catchPhrase)"
    }
}

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

            switch result {
            case .success(let receivedUsers):
                completion(receivedUsers?.map({ apiUser in
                    User(apiUser: apiUser)
                }))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

protocol Repo {
    func getUsers(at completion: @escaping ([User]?) -> ())
}

extension Repo {
    
}
