//
//  HomeTabVC.swift
//  Careerly
//
//  Created by User on 2022/05/17.
//

import UIKit

class HomeTabVC: UIViewController {

    // MARK: - @IBOutlet Part
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        configureTableView()
    }
    
    // MARK: - Custom Method Part
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableView() {
        configureTableViewHeader()
        registerCell()
    }
    
    func configureTableViewHeader() {
        // TableView 헤더 설정
        let headerNib = UINib(nibName: TableViewHeaderView.identifier, bundle: nil)
        guard let headerView = headerNib.instantiate(withOwner: self).first as? UIView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        tableView.tableHeaderView = headerView
    }
    
    func registerCell() {
        let FeedNib = UINib(nibName: FeedTVC.identifier, bundle: nil)
        tableView.register(FeedNib, forCellReuseIdentifier: FeedTVC.identifier)
    }
}

// MARK: - Extension Part
extension HomeTabVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
}

extension HomeTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let feedTVC = tableView.dequeueReusableCell(withIdentifier: FeedTVC.identifier, for: indexPath) as? FeedTVC else { return UITableViewCell()}
        
        return feedTVC
    }
}