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
            static let comment = "commentCell"
            static let subscribe = "subscribeCell"
        }
        
        enum ImageNames {
            static let deadpool = "Deadpool"
            static let wolverine = "Wolverine"
            static let daredevil = "Daredevil"
            static let goblin = "Goblin"
            static let bros = "Bros"
            static let withMiles = "WithMiles"
            static let octopus = "DocOc"
            static let withoutMask = "WithoutMask"
            static let flight = "Flight"
            static let maryJane = "MJ"
            static let scientist = "Scientist"
        }
        
        enum TextForLikeUI {
            static let today = "Cегодня"
            static let thisWeek = "На этой неделе"
            static let subscribeButtonText = "Подписаться"
            static let wolverineComment = "Прокомментировал(-а) Arrrrrgh!!!"
            static let deadpoolComment = "Прокомментировал(-а) Ты похож на пережаренную чимичангу!"
            static let daredevilComment = "Прокомментировал(-а) Не вижу ничего плохого"
            static let maryJaneComment = "Прокомментировал(-а) 🕷🕷🕷 #Spider_Power!"
            static let subscribedText = "Подписался(-ась) на ваши обновления"
            static let subscribeText = "Есть в Instagram. Вы можете знать этого человека"
            static let scientistComment = "Знаете, я тоже своего рода ученый! 🧪👨‍🔬"
            static let threeHours = "3 ч."
            static let twoHours = "2 ч."
            static let oneHour = "1 ч."
            static let fourDays = "4 д."
            static let twoDays = "2 д."
            static let oneDay = "1 д."
        }
        
        enum ColorsForUI {
            static let blackWhiteForUI = "instagramBlackForUI"
        }
        
        enum TableCellTypes {
            case today
            case thisWeek
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private visual components
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private properties
    private var interactionsToday: [InteractionModel] = []
    private var interactionsThisWeek: [InteractionModel] = []
    private var tableCellTypes: [Constants.TableCellTypes] = [.today, .thisWeek]
    private let today = CommentTableViewCell()
    
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
        createThisWeekInteraction()
    }
    
    private func  createInteraction() -> [InteractionModel] {
        interactionsToday = [InteractionModel(imageName: Constants.ImageNames.bros,
                                              profileImageName: Constants.ImageNames.wolverine,
                                              commentText: Constants.TextForLikeUI.wolverineComment,
                                              timeText: Constants.TextForLikeUI.oneHour),
                             InteractionModel(imageName: Constants.ImageNames.withoutMask,
                                              profileImageName: Constants.ImageNames.deadpool,
                                              commentText: Constants.TextForLikeUI.subscribeText,
                                              isSubscribe: false,
                                              timeText: Constants.TextForLikeUI.threeHours),
                             InteractionModel(imageName: Constants.ImageNames.withMiles,
                                              profileImageName: Constants.ImageNames.daredevil,
                                              commentText: Constants.TextForLikeUI.daredevilComment,
                                              timeText: Constants.TextForLikeUI.twoHours),
                             InteractionModel(imageName: Constants.ImageNames.scientist,
                                              profileImageName: Constants.ImageNames.octopus,
                                              commentText: Constants.TextForLikeUI.scientistComment,
                                              timeText: Constants.TextForLikeUI.twoHours)
        ]
        return interactionsToday
    }
    
    private func createThisWeekInteraction() -> [InteractionModel] {
        interactionsThisWeek = [InteractionModel(imageName: Constants.ImageNames.withoutMask,
                                                 profileImageName: Constants.ImageNames.maryJane,
                                                 commentText: Constants.TextForLikeUI.maryJaneComment,
                                                 isSubscribe: nil,
                                                 timeText: Constants.TextForLikeUI.fourDays),
                                InteractionModel(imageName: Constants.ImageNames.flight,
                                                 profileImageName: Constants.ImageNames.goblin,
                                                 commentText: Constants.TextForLikeUI.subscribedText,
                                                 isSubscribe: false,
                                                 timeText: Constants.TextForLikeUI.oneDay),
                                InteractionModel(imageName: Constants.ImageNames.octopus,
                                                 profileImageName: Constants.ImageNames.octopus,
                                                 commentText: Constants.TextForLikeUI.subscribedText,
                                                 isSubscribe: true,
                                                 timeText: Constants.TextForLikeUI.oneDay)
        ]
        return interactionsThisWeek
    }
    
    private func createTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension LikeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = tableCellTypes[section]
        switch type {
        case .today:
            return interactionsToday.count
        case .thisWeek:
            return interactionsThisWeek.count
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
            let model = interactionsToday[indexPath.row]
            if let subscribe = model.isSubscribe {
                guard let thisWeekCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.CellIdentifiers.subscribe,
                    for: indexPath
                ) as? SubscribeTableViewCell
                else { return UITableViewCell() }
                thisWeekCell.refresh(model)
                return thisWeekCell
            } else {
                guard let todayCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.comment,
                                                                    for: indexPath) as? CommentTableViewCell
                else { return UITableViewCell() }
                todayCell.refresh(model)
                return todayCell
            }
        case .thisWeek:
            let model = interactionsThisWeek[indexPath.row]
            if let subscribe = model.isSubscribe {
                guard let thisWeekCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.CellIdentifiers.subscribe,
                    for: indexPath
                ) as? SubscribeTableViewCell
                else { return UITableViewCell() }
                thisWeekCell.refresh(model)
                return thisWeekCell
            } else {
                guard let todayCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.comment,
                                                                    for: indexPath) as? CommentTableViewCell
                else { return UITableViewCell() }
                todayCell.refresh(model)
                return todayCell
            }
        }
    }
}
