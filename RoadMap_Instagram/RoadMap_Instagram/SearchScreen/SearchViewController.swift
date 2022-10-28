//
//  SearchViewController.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 23.10.2022.
//

import UIKit

/// Экран просмотра пользователя
final class SearchViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        enum CellIdentifiers {
        static let subscribeInfo = "subscribeCell"
        static let profileInfo = "infoCell"
        static let archive = "archiveCell"
        static let post = "postCell"
        }
        
        enum TableCellTypes {
            case subscribeInfo
            case profileInfo
            case acrhive
            case post
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Visual elements
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private properties
    private var tableCellTypes: [Constants.TableCellTypes] = [.subscribeInfo, .profileInfo, .acrhive, .post]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        refresherControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refresherControl)
        createTable()
    }
    
    private func createTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func handleRefreshAction() {
        refresherControl.endRefreshing()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let screen = tableCellTypes[indexPath.row]
        switch screen {
        case .subscribeInfo:
            guard let subscribeInfo = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.subscribeInfo,
                for: indexPath) as? SubscribeInfoTableViewCell else { return UITableViewCell() }
            return subscribeInfo
        case .profileInfo:
            guard let profileInfo = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.profileInfo,
                for: indexPath) as? ProfileInfoTableViewCell else { return UITableViewCell() }
            return profileInfo
        case .acrhive:
            guard let archive = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.archive,
                for: indexPath) as? ArchiveTableViewCell else { return UITableViewCell() }
            return archive
        case .post:
            guard let post = tableView.dequeueReusableCell(
                withIdentifier: Constants.CellIdentifiers.post,
                for: indexPath) as? ProfilePostTableViewCell else { return UITableViewCell() }
            return post
        }
    }
}
