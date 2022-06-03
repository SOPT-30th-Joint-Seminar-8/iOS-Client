//
//  PostDetailViewController.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/17.
//

import UIKit

class PostDetailViewController: UIViewController {
    // MARK: - @IBOutlet Part
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var postTableView: UITableView!
    
    // MARK: - Vars & Lets Part
    var model: Post?
    var postText : String?
    var postId: String?
    var comments: [Comment] = [] { 
        didSet { postTableView.reloadData() }
    }
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTextField()
        registerNib()
        setUpDelegate()
        setTableView()
        getComment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Custom Method Part
    private func registerNib(){
        let postNib = UINib(nibName: PostDetailTVC.identifier, bundle: nil)
        postTableView.register(postNib, forCellReuseIdentifier: PostDetailTVC.identifier)
        let commentNib = UINib(nibName: PostCommentTVC.identifier, bundle: nil)
        postTableView.register(commentNib, forCellReuseIdentifier: PostCommentTVC.identifier)
    }
    
    private func setUpDelegate(){
        postTableView.dataSource = self
    }
    
    private func setTableView(){
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = 500
    }
    
    private func configureUI(){
        submitBtn.backgroundColor = UIColor(rgb: 0xEFC3BC)
        submitBtn.tintColor = UIColor(rgb: 0xFFFFFF)
        submitBtn.layer.cornerRadius = 7
    }
    
    private func setUpTextField(){
        commentTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        submitBtn.isEnabled = commentTextField.hasText
        submitBtn.backgroundColor = UIColor(rgb: commentTextField.hasText ? 0xED6653 :0xEFC3BC)
    }
    
    // MARK: - @IBAction Part
    @IBAction func submitBtnTap(_ sender: Any) -> Void {
        guard let commentText = commentTextField.text else { return }
        if let postId = model?.postId {
            postComment(postId: postId, contents: commentText)
            getComment()
            self.postTableView.reloadData()
        } else {
            postComment(postId: self.postId ?? "", contents: commentText)
            getComment()
            self.postTableView.reloadData()
        }
    }
}

// MARK: - Extension Part
extension PostDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as? PostDetailTVC else { return UITableViewCell() }
            if let model = model {
                cell.setData(model)
            } else {
                cell.setSampleData(PostDetailModel(postText: postText ?? ""))
            }
            return cell
        case 1:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostCommentTVC.identifier, for: indexPath) as? PostCommentTVC else { return UITableViewCell() }
            cell.setData(comments[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

//MARK: - API

extension PostDetailViewController {
    func postComment(postId: String, contents: String) {
        CommentService.shared.postComment(postId: postId, contents: contents) { response in
            switch response {
            case .success(_):
                self.commentTextField.text?.removeAll()
            case .requestErr(let data):
                print(data)
            case .pathErr(let data):
                print(data)
            case .serverErr:
                print("Server Error")
            case .networkFail:
                print("Network Fail")
            }
        }
    }
    
    func getComment(){
        CommentService.shared.getComment(postId: self.postId ?? ""){ response in
            switch response {
            case .success(let data):
                guard let data = data as? BaseResponse<[Comment]> else { return }
                guard let commentData = data.data else { return }
                self.comments = commentData
            case .requestErr(let data):
                print(data)
            case .pathErr(let data):
                print(data)
            default:
                print("DEBUG: Fail to get comments.")
            }
        }
    }

}
