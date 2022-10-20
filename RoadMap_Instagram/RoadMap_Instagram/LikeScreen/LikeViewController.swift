//
//  LikeViewController.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 19.10.2022.
//

import UIKit

/// Экран лайков и ответов
final class LikeViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        enum CellIdentifiers {
            static let today = "todayCell"
            static let thisWeek = "thisWeekCell"
        }
        
        enum ImageNames {
            static let deadpool = "Deadpool"
            static let wolverine = "Wolverine"
            static let daredevil = "Daredevil"
            static let bros = "Bros"
            static let withMiles = "WithMiles"
            static let withoutMask = "WithoutMask"
        }
        
        enum TextForLikeUI {
            static let today = "Cегодня"
            static let thisWeek = "На этой неделе"
            static let likeText = "Нравится"
            static let wolverineComment = "Arrrrrgh!!!"
            static let deadpoolComment = "Ты похож на пережаренную чимичангу!"
            static let daredevilComment = "Не вижу ничего плохого"
            static let threeDays = "5 ч."
            static let twoHours = "2 ч."
            static let oneHour = "1 ч."
        }
        
        enum ColorsForUI {
            static let blackWhiteForUI = "instagramBlackForUI"
        }
        
        enum TableCellTypes {
            case today
            case thisWeek
        }
    }
    
    // MARK: - Private Visual elements
    @IBOutlet private weak var tableView: UITableView!
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private properties
    private var interactions: [InteractionModel] = []
    private var tableCellTypes: [Constants.TableCellTypes] = [.today, .thisWeek]
    private let today = TodayTableViewCell()
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Private methods
    @objc private func handleRefresh() {
        refresherControl.endRefreshing()
    }
    
    private func setupUI() {
        refresherControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.addSubview(refresherControl)
        createTable()
        createInteraction()
    }
    
    private func  createInteraction() -> [InteractionModel] {
        interactions = [InteractionModel(imageName: Constants.ImageNames.bros,
                                         profileName: Constants.ImageNames.wolverine,
                                         profileImageName: Constants.ImageNames.wolverine,
                                         likeText: Constants.TextForLikeUI.likeText,
                                         commentText: Constants.TextForLikeUI.wolverineComment,
                                         timeText: Constants.TextForLikeUI.oneHour),
                        InteractionModel(imageName: Constants.ImageNames.withoutMask,
                                         profileName: Constants.ImageNames.deadpool,
                                         profileImageName: Constants.ImageNames.deadpool,
                                         likeText: Constants.TextForLikeUI.likeText,
                                         commentText: Constants.TextForLikeUI.deadpoolComment,
                                         timeText: Constants.TextForLikeUI.threeDays),
                        InteractionModel(imageName: Constants.ImageNames.withMiles,
                                         profileName: Constants.ImageNames.daredevil,
                                         profileImageName: Constants.ImageNames.daredevil,
                                         likeText: Constants.TextForLikeUI.likeText,
                                         commentText: Constants.TextForLikeUI.daredevilComment,
                                         timeText: Constants.TextForLikeUI.twoHours)
                        ]
        return interactions
    }
    
    private func createTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extemsion
extension LikeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .today:
            return interactions.count
        case .thisWeek:
            return interactions.count
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.text = header.textLabel?.text?.capitalizedSentence
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header.textLabel?.textColor = UIColor(named: Constants.ColorsForUI.blackWhiteForUI)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Constants.TextForLikeUI.today
        default:
            return Constants.TextForLikeUI.thisWeek
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .today:
            let model = interactions[indexPath.row]
            guard let todayCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.today,
                                                                for: indexPath) as? TodayTableViewCell else {
                return UITableViewCell() }
            todayCell.refresh(model)
            return todayCell
        case .thisWeek:
            let model = interactions[indexPath.row]
            guard let thisWeekCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.thisWeek,
                                                                for: indexPath) as? ThisWeekTableViewCell else {
                return UITableViewCell() }
            thisWeekCell.refresh(model)
            return thisWeekCell
        }
    }
}
