//
//  GetCommentModel.swift
//  Careerly
//
//  Created by 안현주 on 2022/06/03.
//

import Foundation

struct GetCommentModel: Codable {
    let reviewID, userName, userEmail: String
    let userImg: String
    let text, createdAt: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case userName, userEmail, userImg, text, createdAt
    }
}
