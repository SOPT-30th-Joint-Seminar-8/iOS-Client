//
//  PostCommentTVC.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/24.
//

import UIKit

class PostCommentTVC: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    static let identifier = "PostCommentTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(_ data: CommentModel){
        commentLabel.text = data.text
    }
}
