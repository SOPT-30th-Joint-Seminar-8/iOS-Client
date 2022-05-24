//
//  PostDetailTVC.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/19.
//

import UIKit

class PostDetailTVC: UITableViewCell {

    static let identifier = "PostDetailTVC"
    @IBOutlet weak var postTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ data: PostModel){
        postTextLabel.text = data.postText
    }
    
}
