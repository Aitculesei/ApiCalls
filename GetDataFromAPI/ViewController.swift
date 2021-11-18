//
//  ViewController.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    private(set) var users: [Users] = [] {
        didSet {
//            DispatchQueue.main.async { self.tableView.reloadData() }
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GetPostsApi().getPosts(from: Constants.postsURL) { $0.printData() }
        GetCommentsApi().getComments(from: Constants.commentsURL) { $0.printData() }
//        GetAlbumsApi().getAlbums(from: albumsURL) { $0.printData() }
        GetDadjokeApi().getDadjokes(from: Constants.dadjokesURL) { dadjokeJSON in
            dadjokeJSON.printData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUsers(_ users: [Users]) {
        self.users = users
    }
}

// MARK: - Constants

struct Constants {
    static let postsURL = "https://jsonplaceholder.typicode.com/posts"
    static let usersURL = "https://jsonplaceholder.typicode.com/users"
    static let commentsURL = "https://jsonplaceholder.typicode.com/comments"
    static let albumsURL = "https://jsonplaceholder.typicode.com/albums"
    static let dadjokesURL = "https://icanhazdadjoke.com/"
}

// MARK: - Extensions

// Delegate is used to handle interactions of cells
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GetUsersApi().getUsers(from: Constants.usersURL) { self.setUsers($0) }
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(self.users[indexPath.row].id) | \(self.users[indexPath.row].name) | \(self.users[indexPath.row].username) | \(self.users[indexPath.row].email) )"
        
        return cell
    }
}
