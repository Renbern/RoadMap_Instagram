//
//  ArchiveTableViewCell.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 23.10.2022.
//

import UIKit

/// Ячейка архива
final class ArchiveTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let importantName = "Важное"
        static let highlightName = "Важное"
        static let partyName = "Важное"
        static let altronName = "Важное"
        static let familyName = "Важное"
        static let starkCorpName = "Важное"
        static let avangersName = "Важное"
        static let highlightIcon = "archiveIcon"
        static let cellIdentificator = "archiveCollectionViewCell"
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    var archiveItems: [Archive] {
        var important = Archive()
        important.name = Constants.importantName
        important.imageName = Constants.highlightIcon
        
        var highlight = Archive()
        highlight.name = Constants.highlightName
        highlight.imageName = Constants.highlightIcon
        
        var party = Archive()
        party.name = Constants.partyName
        party.imageName = Constants.highlightIcon
        
        var altron = Archive()
        altron.name = Constants.altronName
        altron.imageName = Constants.highlightIcon
        
        var family = Archive()
        family.name = Constants.familyName
        family.imageName = Constants.highlightIcon
        
        var starkCorp = Archive()
        starkCorp.name = Constants.starkCorpName
        starkCorp.imageName = Constants.highlightIcon
        
        var avangers = Archive()
        avangers.name = Constants.avangersName
        avangers.imageName = Constants.highlightIcon
        return [important, highlight, party, altron, family, starkCorp, avangers]
    }
    
    // MARK: - Lifecycle
    override class func awakeFromNib() {
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
extension ArchiveTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return archiveItems.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentificator,
            for: indexPath) as? ArchiveCollectionViewCell {
            let model = archiveItems[indexPath.row]
            itemCell.refresh(model)
            return itemCell
        }
        return UICollectionViewCell()
    }
}
