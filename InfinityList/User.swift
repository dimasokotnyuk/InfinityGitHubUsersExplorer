//
//  User.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
    
    static let sample = User(id: 1, name: "test", avatarUrl: "")
}
