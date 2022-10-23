//
//  HomeViewController.swift
//  RoadMap_Instagram
//
//  Created by Артур Щукин on 17.10.2022.
//

import UIKit

/// Экран домашней страницы Инстаграма
final class HomeViewController: UIViewController {
    
    // MARK: - Constants
    private enum CellIdentifiers {
        static let stories = "StoriesCell"
        static let post = "PostCell"
        static let recommend = "RecomendationCell"
    }
    
    private enum TableCellTypes {
        case stories
        case post
        case recomendation
    }
    
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Visual elements
    private let refresherControl = UIRefreshControl()
    
    // MARK: - Private properties
    private var tableCellTypes: [TableCellTypes] = [.stories, .post, .recomendation]
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        refresherControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.addSubview(refresherControl)
        createTable()
    }
    
    private func createTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func handleRefresh() {
        refresherControl.endRefreshing()
    }
}

    // MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableCellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let screen = tableCellTypes[indexPath.row]
        switch screen {
        case .stories:
            guard let storiesCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.stories,
                                                                  for: indexPath) as? StoriesTableViewCell
            else { return UITableViewCell() }
            return storiesCell
        case .post:
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.post,
                                                                 for: indexPath) as? PostTableViewCell
            else { return UITableViewCell() }
            return postCell
        case .recomendation:
            guard let recomendationCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.recommend,
                                                                 for: indexPath) as? RecomendationTableViewCell
            else { return UITableViewCell() }
            return recomendationCell
        }
    }
}
