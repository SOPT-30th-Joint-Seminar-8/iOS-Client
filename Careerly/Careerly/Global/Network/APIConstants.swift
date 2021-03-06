//
//  APIConstants.swift
//  Careerly
//
//  Created by 안현주 on 2022/05/21.
//

import Foundation


import Foundation

struct APIConstants {
    //MARK: - Base URL
    static let baseURL = "http://3.34.192.134:8000"

    //MARK: - Feature URL
    /// 게시글 전체를 가져오기 위한 URL
    static let getPostsURL = baseURL + "/post"
    static let postCommentURL = baseURL + "/review/post"
    static let postWriteURL = baseURL + "/post"
    static let getCommentURL = baseURL + "/review/post"

}

