//
//  Array+printDataFromApi.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 16.11.2021.
//

import Foundation

extension Array {
    func printData() {
        for (index, value) in self.enumerated() {
            
            if let post = value as? Posts {
                print("""
                
                Post number \(index) is:
                user id: \(post.userId)
                id: \(post.id)
                title: \"\(post.title)\"
                body: \"\(post.body)\"
                """)
            } else if let user = value as? User {
                print("""
                
                User number \(index) is:
                id: \(user.id)
                name: \(user.name)
                username: \(user.username)
                email: \(user.email)
                address:
                    street: \(user.address.street)
                    suite: \(user.address.suite)
                    city: \(user.address.city)
                    zipcode: \(user.address.zipcode)
                    geo:
                        lat -> \(user.address.geo.lat)
                        lng -> \(user.address.geo.lng)
                phone: \(user.phone)
                website: \(user.website)
                company:
                    name: \(user.company.name)
                    catchPhrase: \(user.company.catchPhrase)
                    bs: \(user.company.bs)
                """)
            } else if let dadjoke = value as? DadJoke {
                print("""
                    
                    We got a new joke for you!
                    id: \(dadjoke.id)
                    joke: \(dadjoke.joke)
                    status: \(dadjoke.status)
                    """)
            } else if let comment = value as? Comment {
                print("""

                    Comment number \(index) looks like this:
                    post id: \(comment.postId)
                    id: \(comment.id)
                    name: \(comment.name)
                    email: \(comment.email)
                    body: \"\(comment.body)\"
                    """)
            } else if let album = value as? Album {
                print("""

                    Album number \(index) looks like this:
                    user id: \(album.userId)
                    id: \(album.id)
                    title: \(album.title)
                    """)
            }
        }
    }
}
