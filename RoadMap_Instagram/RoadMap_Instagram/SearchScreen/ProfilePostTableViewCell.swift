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
        static let ironMan5 = "iron5"
        static let cellName = "profilePostCollectionViewCell"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    private var postImageNames = [
        Constants.ironMan1, Constants.ironMan2, Constants.ironMan3, Constants.ironMan4, Constants.ironMan5
    ]
    
    private var posts: [Post] = []
    
    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        addPost()
    }
    
    private func addPost() {
        for post in postImageNames {
            posts.append(Post(imageName: post))
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfilePostTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellName,
            for: indexPath) as? ProfilePostCollectionViewCell {
            let model = posts[indexPath.row]
            itemCell.refresh(model)
            return itemCell
        }
        return UICollectionViewCell()
    }
}
