//
//  BaseModel.swift
//  Careerly
//
//  Created by User on 2022/05/26.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
