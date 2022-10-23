//
//  PostTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 23.10.2022.
//

import UIKit

/// Ячейка постов
final class ProfilePostTableViewCell: UITableViewCell {

    // MARK: - Constants
    private enum Constants {
        static let ironMan1 = "iron1"
        static let ironMan2 = "iron2"
        static let ironMan3 = "iron3"
        static let ironMan4 = "iron4"
        static let cellName = "profilePostCollectionViewCell"
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    var postItems: [Post] {
        var post1 = Post()
        post1.imageName = Constants.ironMan1
        
        var post2 = Post()
        post2.imageName = Constants.ironMan3
        
        var post3 = Post()
        post3.imageName = Constants.ironMan2
        
        var post4 = Post()
        post4.imageName = Constants.ironMan3
        
        var post5 = Post()
        post5.imageName = Constants.ironMan3
        
        var post6 = Post()
        post6.imageName = Constants.ironMan4
        
        var post7 = Post()
        post7.imageName = Constants.ironMan1
        
        var post8 = Post()
        post8.imageName = Constants.ironMan1
        
        var post9 = Post()
        post9.imageName = Constants.ironMan4
        
        var post10 = Post()
        post10.imageName = Constants.ironMan2
        
        var post11 = Post()
        post11.imageName = Constants.ironMan2
        
        var post12 = Post()
        post12.imageName = Constants.ironMan1
        
        var post13 = Post()
        post13.imageName = Constants.ironMan2
        return [post1, post2, post3, post4, post5, post6, post7, post8, post9, post10, post11, post12]
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfilePostTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellName,
            for: indexPath) as? ProfilePostCollectionViewCell {
            let model = postItems[indexPath.row]
            itemCell.refresh(model)
            return itemCell
        }
        return UICollectionViewCell()
    }
}
