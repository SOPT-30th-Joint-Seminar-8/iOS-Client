//
//  PopularProfileCVC.swift
//  Careerly
//
//  Created by User on 2022/05/19.
//

import UIKit

class PopularProfileCVC: UICollectionViewCell {
    // MARK: - Vars & Lets Part
    static let identifier = "PopularProfileCVC"
    
    // MARK: - @IBOutlet Part
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    // MARK: - Custom Method Part
    func setUI() {
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        
        addShadow()
    }
    
    func addShadow() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = false

        layer.shadowRadius = 3.5
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    func setData(_ data: HotProfile) {
        userName.text = data.userName
        jobLabel.text = data.job
        followersCountLabel.text = "팔로워 \(data.followers)명 이상"
    }
}
