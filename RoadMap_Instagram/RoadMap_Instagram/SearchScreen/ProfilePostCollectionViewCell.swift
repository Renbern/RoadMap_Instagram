//
//  ProfilePostCollectionViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 23.10.2022.
//

import UIKit

/// Ячейка поста
final class ProfilePostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Public methods
    func refresh(_ model: Post) {
        imageView.image = UIImage(named: model.imageName ?? "")
    }
}
