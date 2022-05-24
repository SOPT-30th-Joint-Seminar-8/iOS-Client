//
//  FeedTVC.swift
//  Careerly
//
//  Created by User on 2022/05/18.
//

import UIKit

protocol FeedTVCDelegate: AnyObject {
    func showPostDetailView()
}

class FeedTVC: UITableViewCell {
    // MARK: - Vars & Lets Part
    static let identifier = "FeedTVC"
    weak var delegate: FeedTVCDelegate?
    
    var indexPath: Int?
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - @IBAction Part
    @IBAction func commentBtnTap(_ sender: UIButton) {
        delegate?.showPostDetailView()
    }
    
}
