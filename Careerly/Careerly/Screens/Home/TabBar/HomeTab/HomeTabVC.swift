//
//  HomeTabVC.swift
//  Careerly
//
//  Created by User on 2022/05/17.
//

import UIKit

class HomeTabVC: UIViewController {
    // MARK: - Vars & Lets Part
    private var feedList = [Post]() {
        didSet { tableView.reloadData() }
    }
    
    private var popularProfileList = [HotProfile]() {
        didSet { tableView.reloadData() }
    }
        
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
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
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
        return feedList.count + (feedList.count / 3)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 4 == 3 {
            guard let popularProfileCell = tableView.dequeueReusableCell(
                withIdentifier: PopularProfileTVC.identifier,
                for: indexPath) as? PopularProfileTVC
            else { return UITableViewCell() }
            
            popularProfileCell.profiles = popularProfileList
            return popularProfileCell
        }
        guard let feedCell = tableView.dequeueReusableCell(
            withIdentifier: FeedTVC.identifier,
            for: indexPath) as? FeedTVC
        else { return UITableViewCell() }
        
        feedCell.delegate = self
        feedCell.model = feedList[indexPath.row - indexPath.row/4]
        feedCell.indexPath = indexPath.row - indexPath.row/4
        return feedCell
    }
}

extension HomeTabVC: TableViewHeaderViewDelegate {
    func showPostView() {
        guard let postVC = UIStoryboard(name: "Post", bundle: nil).instantiateViewController(withIdentifier: "PostViewController")
                as? PostViewController
        else { return }
        navigationController?.pushViewController(postVC, animated: true)
    }
}

extension HomeTabVC: FeedTVCDelegate {
    func showPostDetailView(_ cell: FeedTVC) {
        guard let postDetailVC = UIStoryboard(name: "PostDetail", bundle: nil).instantiateViewController(withIdentifier: "PostDetailViewController")
                as? PostDetailViewController, let indexPathForModel = cell.indexPath
        else { return }
        postDetailVC.model = feedList[indexPathForModel]
        postDetailVC.postId = feedList[indexPathForModel].postId
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
}


extension HomeTabVC: UIGestureRecognizerDelegate {
}
 
//MARK: - API
extension HomeTabVC {
    func getPosts() {
        PostService.shared.getPosts { response in
            switch response {
            case .success(let data):
                guard let data = data as? BaseResponse<PostData> else { return }
                guard let postData = data.data else { return }
                self.feedList = postData.posts
                self.popularProfileList = postData.hotProfiles
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

