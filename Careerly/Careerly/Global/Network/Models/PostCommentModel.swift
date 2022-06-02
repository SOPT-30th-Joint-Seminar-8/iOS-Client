//
//  postCommentModel.swift
//  Careerly
//
//  Created by User on 2022/05/31.
//

import Foundation

struct PostCommentModel: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}

struct Comment: Codable {
    let reviewID: String
    let userName: String
    let userEmail: String
    let userImg: String
    let text: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case userName, userEmail, userImg, text, createdAt
    }
}
