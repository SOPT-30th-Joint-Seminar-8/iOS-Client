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
}
