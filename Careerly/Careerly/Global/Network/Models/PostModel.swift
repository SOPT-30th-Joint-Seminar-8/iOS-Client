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

// 게시글 작성 모델
// TODO-: _ 언더바 이런건 서버분들에게 빼달라고 해야하는지
struct AddPostData: Codable{
    let _id: String
}
