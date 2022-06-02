//
//  FeedTVC.swift
//  Careerly
//
//  Created by User on 2022/05/18.
//

import UIKit

protocol FeedTVCDelegate: AnyObject {
    func showPostDetailView(_ cell: FeedTVC)
}

class FeedTVC: UITableViewCell {
    // MARK: - Vars & Lets Part
    static let identifier = "FeedTVC"
    weak var delegate: FeedTVCDelegate?
    var model: Post? {
        didSet {
            guard let model = model else { return }
            setData(model)
        }
    }
    
    var indexPath: Int?
    
    // MARK: - @IBOutlet Part
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likesCountImageView: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Custom Method Part
    func setData(_ model: Post) {
        userNameLabel.text = model.userName
        if let imageURL = URL(string: model.userImg) {
            userProfileImageView.setImage(imageURL)
        }
        emailLabel.text = model.userEmail
        timeLabel.text = model.createdAt.serverTimeToString(forUse: .forNotification)
        contentLabel.text = model.text
        likesCountLabel.text = "\(model.likes)명이 추천했어요"
        viewsLabel.text = "조회 \(model.views)"
        
        if model.likes >= 3 {
            likesCountImageView.image = UIImage(named: "Property 1=3")
        }
    }
    
    // MARK: - @IBAction Part
    @IBAction func commentBtnTap(_ sender: UIButton) {
        delegate?.showPostDetailView(self)
    }
}
