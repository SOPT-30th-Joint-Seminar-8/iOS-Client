//
//  WriteModel.swift
//  Careerly
//
//  Created by 안현주 on 2022/06/03.
//


import Foundation

struct WriteModel: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}
