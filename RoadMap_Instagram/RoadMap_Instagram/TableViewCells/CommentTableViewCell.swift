//
//  LikeTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 19.10.2022.
//

import UIKit

/// Ячейка взаимодействий сегодня
final class CommentTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var subscriberImageView: UIImageView!
    @IBOutlet private weak var interactionTextLabel: UILabel!
    @IBOutlet private weak var interactedImageView: UIImageView!
    
    // MARK: - Public methods
    func refresh(_ model: InteractionModel) {
        subscriberImageView.image = UIImage(named: model.profileImageName)
        interactionTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.profileImageName) ")
            .normal("\(model.commentText)")
            .grayTextColor(" \(model.timeText)")
        interactedImageView.image = UIImage(named: model.imageName)
    }
}
