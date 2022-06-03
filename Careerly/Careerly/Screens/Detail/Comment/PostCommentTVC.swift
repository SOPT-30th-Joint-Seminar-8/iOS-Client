//
//  PostCommentTVC.swift
//  Careerly
//
//  Created by Sojin Lee on 2022/05/24.
//

import UIKit

class PostCommentTVC: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    static let identifier = "PostCommentTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
//    func setData(_ data: CommentModel){
//        commentLabel.text = data.text
//    }
    
    func setData(_ data: Comment){
        commentLabel.text = data.text
        userNameLabel.text = data.userName
        userEmailLabel.text = data.userEmail
        if let imageURL = URL(string: data.userImg) {
            userImage.setImage(imageURL)
        }
    }
}
