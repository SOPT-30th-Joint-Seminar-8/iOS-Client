//
//  PostDetailViewController.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/17.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    var postText : String?
    @IBOutlet weak var postTableView: UITableView!
    var commentData : [PostCommentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTextField()
        registerNib()
        setUpDelegate()
        setTableView()
    }
    
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

    @IBAction func submitBtnTap(_ sender: Any) {
        guard let commentText = commentTextField.text else { return }
        commentData.append(PostCommentModel(comment: commentText))
        commentTextField.text?.removeAll()
        postTableView.reloadData()
    }
    
}

extension PostDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : commentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as? PostDetailTVC else { return UITableViewCell() }
            cell.setData(PostModel(postText: "내 이름은 이소진이다~!!"))
            return cell
        case 1:
            guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostCommentTVC.identifier, for: indexPath) as? PostCommentTVC else { return UITableViewCell() }
            cell.setData(commentData[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
