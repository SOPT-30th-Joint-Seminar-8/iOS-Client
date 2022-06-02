//
//  PostDetailTVC.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/19.
//

import UIKit

class PostDetailTVC: UITableViewCell {

    // MARK: - Vars & Lets Part
    static let identifier = "PostDetailTVC"
    
    // MARK: - @IBOutlet Part
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var likesCountImageView: UIImageView!
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Custom Method Part
    func setData(_ data: Post){
        userNameLabel.text = data.userName
        postTextLabel.text = data.text
        if let imageURL = URL(string: data.userImg) {
            profileImageView.setImage(imageURL)
        }
        emailLabel.text = data.userEmail
        timeLabel.text = data.createdAt.serverTimeToString(forUse: .forNotification)
        likesCountLabel.text = "\(data.likes)명이 추천했어요"
        viewsLabel.text = "조회 \(data.views)"
        
        if data.likes >= 3 {
            likesCountImageView.image = UIImage(named: "Property 1=3")
        }
    }
    
    func setSampleData(_ data: PostDetailModel){
        userNameLabel.text = "이소진"
        postTextLabel.text = data.postText
        if let imageURL = URL(string: "https://images.unsplash.com/photo-1541363111435-5c1b7d867904?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670") {
            profileImageView.setImage(imageURL)
        }
        emailLabel.text = "aaaaa@gmail.com"
        timeLabel.text = "2022-05-17T08:41:25.000Z".serverTimeToString(forUse: .forNotification)
        likesCountLabel.text = "3명이 추천했어요"
        viewsLabel.text = "조회 152"
        likesCountImageView.image = UIImage(named: "Property 1=3")
    }
}
