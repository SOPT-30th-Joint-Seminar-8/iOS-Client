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
        configureNavigationBar()
        getPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
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
    
    func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureTableViewHeader() {
        // TableView 헤더 설정
        let headerNib = UINib(nibName: TableViewHeaderView.identifier, bundle: nil)
        guard let headerView = headerNib.instantiate(withOwner: self).first as? TableViewHeaderView else { return }
        headerView.delegate = self
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        tableView.tableHeaderView = headerView
    }
    
    func registerCell() {
        let FeedNib = UINib(nibName: FeedTVC.identifier, bundle: nil)
        tableView.register(FeedNib, forCellReuseIdentifier: FeedTVC.identifier)
        let PopularProfileNib = UINib(nibName: PopularProfileTVC.identifier, bundle: nil)
        tableView.register(PopularProfileNib, forCellReuseIdentifier: PopularProfileTVC.identifier)
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
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 0 && indexPath.row > 0 {
            guard let popularProfileCell = tableView.dequeueReusableCell(
                withIdentifier: PopularProfileTVC.identifier,
                for: indexPath) as? PopularProfileTVC
            else { return UITableViewCell()}
            
            return popularProfileCell
        }
        guard let feedCell = tableView.dequeueReusableCell(
            withIdentifier: FeedTVC.identifier,
            for: indexPath) as? FeedTVC
        else { return UITableViewCell()}
        feedCell.delegate = self
        
        return feedCell
    }
}

extension HomeTabVC: TableViewHeaderViewDelegate {
    func showPostView() {
        guard let postVC = UIStoryboard(name: "Post", bundle: nil).instantiateViewController(withIdentifier: "PostViewController") as? PostViewController else { return }
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(postVC, animated: true)
    }
}

extension HomeTabVC: FeedTVCDelegate {
    func showPostDetailView() {
        guard let postDetailVC = UIStoryboard(name: "PostDetail", bundle: nil).instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController else { return }
        postDetailVC.postText = "sample text"
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
}
 
//MARK: - API
extension HomeTabVC {
    func getPosts() {
        PostService.shared.getPosts { response in
            switch response {
            case .success(let data):
                print(data)
            case .requestErr(let data):
                print("request error")
                print(data)
            case .pathErr(let data):
                print("path error")
                print(data)
            default:
                print("DEBUG: Fail to get Posts.")
                return
            }
        }
    }
}
