//
//  APIService.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    func getUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
        var components = URLComponents(string: "https://api.github.com/users")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : nil)
        ]
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
