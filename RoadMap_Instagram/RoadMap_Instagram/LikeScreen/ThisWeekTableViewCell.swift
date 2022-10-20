//
//  ThisWeekTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

import UIKit

/// Ячейка взаимодействий на этой неделе
final class ThisWeekTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        enum Comment {
            static let commentLabel = "Прокомментировал(-а): "
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var interactedImageView: UIImageView!
    @IBOutlet weak var commentTextLabel: UILabel!
    @IBOutlet weak var subscriberImageView: UIImageView!
    
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
        commentTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.profileName) ")
            .normal("\(Constants.Comment.commentLabel)")
            .normal("\(model.commentText)")
            .grayTextColor(" \(model.timeText)")
        interactedImageView.image = UIImage(named: model.imageName)
    }
}
