//
//  Constants.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 26.11.2021.
//

import Foundation

struct C {
    enum ListTableView {
        static let cellId = "ListTableViewCellId"
    }
    enum CollectionView {
        static let cellId = "CollectionViewCellId"
    }
    
    enum APICallURL {
        static let posts = "https://jsonplaceholder.typicode.com/posts"
        static let users = "https://jsonplaceholder.typicode.com/users"
        static let comments = "https://jsonplaceholder.typicode.com/comments"
        static let albums = "https://jsonplaceholder.typicode.com/albums"
        static let dadJokes = "https://icanhazdadjoke.com/"
        static let profileImage = "http://graph.facebook.com/7/picture"
    }
    
    enum ImagesURL {
        static let clouds = "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg"
    }
}
