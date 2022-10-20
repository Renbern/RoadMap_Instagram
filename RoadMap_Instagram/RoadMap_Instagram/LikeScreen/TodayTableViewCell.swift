//
//  LikeTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 19.10.2022.
//

import UIKit

/// Ячейка взаимодействий сегодня
final class TodayTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        enum Comment {
            static let commentLabel = "Прокомментировал(-а): "
            static let timeColor = "commentsGray"
        }
    }
    // MARK: - IBOutlets
    @IBOutlet private weak var subscriberImageView: UIImageView!
    @IBOutlet private weak var interactionTextLabel: UILabel!
    @IBOutlet private weak var interactedImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public methods
    public func refresh(_ model: InteractionModel) {
        subscriberImageView.image = UIImage(named: model.profileImageName)
        interactionTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.profileName) ")
            .normal("\(Constants.Comment.commentLabel)")
            .normal("\(model.commentText)")
            .grayTextColor(" \(model.timeText)")
        interactedImageView.image = UIImage(named: model.imageName)
    }
}
