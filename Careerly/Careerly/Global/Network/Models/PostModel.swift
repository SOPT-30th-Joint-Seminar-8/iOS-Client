//
//  PostModel.swift
//  Careerly
//
//  Created by 안현주 on 2022/05/21.
//

import Foundation
import Alamofire

/// 전체 게시글 불러오기 위한 모델
struct PostData: Codable {
    let posts: [Post]
    let hotProfiles: [HotProfile]
}

struct Post: Codable {
    let postId: String
    let userImg: String
    let userName: String
    let userEmail: String
    let text: String
    let likes: Int
    let views: Int
    let createdAt: String
}

struct HotProfile: Codable {
    let userName: String
    let job: String
    let followers: Int
}
