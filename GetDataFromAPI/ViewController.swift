//
//  ViewController.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 11.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private var viewModel = ViewModel()
    private var tableContent: [(String, String)] = []
    private(set) var users: [User] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getUsersFromApi { users, tableContent in
            self.users = users ?? []
            self.tableContent = tableContent
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extensions

// Delegate is used to handle interactions of cells
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me! \(tableContent[indexPath.row])")
        let cell = tableView.dequeueReusableCell(withIdentifier: C.ListTableView.cellId, for: indexPath)
        CollectionViewController().setData("\(users[indexPath.row].email) | \(users[indexPath.row].phone) | \(users[indexPath.row].website)")
//        cell.fillCollectionView(with: tableContent[indexPath.row])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.ListTableView.cellId, for: indexPath) as! TableViewCell
        
        cell.nameLabel.text = tableContent[indexPath.row].0
        cell.emailLabel.text = tableContent[indexPath.row].1
        
        return cell
    }
}
