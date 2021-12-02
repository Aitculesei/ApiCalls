//
//  CollectionViewCell.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 25.11.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var userDataLabel: UILabel!

    func configure(with userData: String) {
        userDataLabel.text = userData
    }
}
