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
        layer.cornerRadius = 4.0        
        layer.applyShadow(color: .black, alpha: 0.25, x: 0, y: 4, blur: 4, spread: 0)
    }
    
    func setData(_ data: HotProfile) {
        userName.text = data.userName
        jobLabel.text = data.job
        followersCountLabel.text = "팔로워 \(data.followers)명 이상"
    }
}
