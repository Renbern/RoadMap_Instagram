//
//  ThisWeekTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 20.10.2022.
//

import UIKit

/// Ячейка взаимодействий на этой неделе
final class SubscribeTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        enum ColorsForUI {
            static let blackWhiteForUI = "instagramBlackForUI"
            static let gray = "commentsGray"
            static let instagramBlue = "instagramBlue"
        }
        enum TextButton {
            static let youSubscribed = "Вы подписаны"
            static let canSubscribe = "Подписаться"
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var subscribeButton: UIButton!
    @IBOutlet private weak var commentTextLabel: UILabel!
    @IBOutlet private weak var subscriberImageView: UIImageView!
    
    // MARK: - Public methods
    func refresh(_ model: InteractionModel) {
        subscriberImageView.image = UIImage(named: model.profileImageName)
        commentTextLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.profileImageName) ")
            .normal("\(model.commentText)")
            .grayTextColor(" \(model.timeText)")
        if model.isSubscribe ?? false {
            subscribeButton.setTitle(Constants.TextButton.youSubscribed, for: .normal)
            subscribeButton.setTitleColor(UIColor(named: Constants.ColorsForUI.blackWhiteForUI), for: .normal)
            subscribeButton.layer.borderColor = UIColor(named: Constants.ColorsForUI.gray)?.cgColor
            subscribeButton.layer.borderWidth = 0.5
        } else {
            subscribeButton.setTitle(Constants.TextButton.canSubscribe, for: .normal)
            subscribeButton.setTitleColor(UIColor(named: Constants.ColorsForUI.blackWhiteForUI), for: .normal)
            subscribeButton.backgroundColor = UIColor(named: Constants.ColorsForUI.instagramBlue)
        }
        subscribeButton.titleLabel?.font = .systemFont(ofSize: 12)
        subscribeButton.layer.cornerRadius = 5
    }
}
