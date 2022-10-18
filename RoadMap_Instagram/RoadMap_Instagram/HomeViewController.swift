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
    enum Constants {
        static let stories = "StoriesCell"
        static let post = "PostCell"
        static let recommend = "RecomendationCell"
    }
    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private Visual elements
    private var refresher = UIRefreshControl()
    
    // MARK: - Lifeсycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.addSubview(refresher)
        createTable()
    }
    
    private func createTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func handleRefresh() {
        refresher.endRefreshing()
    }
}

    // MARK: - Extemsion
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let storiesCell = tableView.dequeueReusableCell(withIdentifier: Constants.stories,
                                                           for: indexPath) as? StoriesTableViewCell, indexPath.row == 0
            else { return UITableViewCell() }
            return storiesCell
        case 1...3:
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: Constants.post,
                                                                 for: indexPath) as? PostTableViewCell
            else { return UITableViewCell() }
            return postCell
        case 4:
            guard let recomendationCell = tableView.dequeueReusableCell(withIdentifier: Constants.recommend,
                                                                 for: indexPath) as? RecomendationTableViewCell
            else { return UITableViewCell() }
            return recomendationCell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
