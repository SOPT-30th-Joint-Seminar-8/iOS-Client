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
