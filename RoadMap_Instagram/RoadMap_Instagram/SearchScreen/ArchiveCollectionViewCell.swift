//
//  ArchiveCollectionViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 23.10.2022.
//

import UIKit

/// Ячейка архивных сторис
final class ArchiveCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Public methods
    func refresh(_ model: Archive) {
        imageView.image = UIImage(named: model.imageName ?? "")
        nameLabel.text = model.name ?? ""
    }
}
