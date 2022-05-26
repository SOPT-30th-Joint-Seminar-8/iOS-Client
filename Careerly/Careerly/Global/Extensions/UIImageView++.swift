//
//  UIImageView++.swift
//  Careerly
//
//  Created by User on 2022/05/27.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(_ imageURL: URL) {
        self.kf.indicatorType = .none
        self.kf.setImage(with: imageURL, options: [.transition(.fade(1))])
    }
}
