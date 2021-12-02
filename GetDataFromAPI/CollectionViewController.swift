//
//  CollectionViewController.swift
//  GetDataFromAPI
//
//  Created by Aitculesei, Andrei on 25.11.2021.
//

import UIKit

class CollectionViewController: UICollectionViewController {

//    @IBOutlet var collectionView: UICollectionView!
    private var data = ""
    private var parsedData = [Substring]()
//    {
//        didSet {
//
//            self.collectionView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.collectionView.reloadData()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setData(_ data: String) {
        self.data = data
        self.parsedData = data.split(separator: "|")
        print("PARSED DATA: \(parsedData)")
    }

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("NUMBER: \(self.parsedData.count)")
        return parsedData.count
//        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CollectionViewCell()
        if let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: C.CollectionView.cellId, for: indexPath) as? CollectionViewCell {
    
            // Configure the cell
            for data in parsedData {
                
                collectionViewCell.configure(with: String(data))
            }
            cell = collectionViewCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You tapped my cell! \(parsedData[indexPath.row])")
    }

}
