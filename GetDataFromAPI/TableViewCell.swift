//
//  TableViewCell.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 25.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    private var collectionViewController = CollectionViewController()

    func fillCollectionView(with data: String) {
        
        self.collectionViewController.setData(data)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
