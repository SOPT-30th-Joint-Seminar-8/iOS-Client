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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpTextField()
        registerNib()
        setUpDelegate()
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = 500
    }
    
    private func registerNib(){
        let postNib = UINib(nibName: PostDetailTVC.identifier, bundle: nil)
        postTableView.register(postNib, forCellReuseIdentifier: PostDetailTVC.identifier)
    }
    
    private func setUpDelegate(){
        postTableView.delegate = self
        postTableView.dataSource = self
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

}

extension PostDetailViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension PostDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postTableView.dequeueReusableCell(withIdentifier: PostDetailTVC.identifier, for: indexPath) as? PostDetailTVC else { return UITableViewCell() }
        cell.setData(PostModel(postText: "내 이름은 이소진이다~!!"))
        return cell
    }
    
}
