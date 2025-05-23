//
//  UserViewModel.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isRequestFailed = false
    
    private let pageLimit = 25
    private var currentLastId: Int? = nil
    
    private var cancellable: AnyCancellable?
    
    func getUsers() {
        cancellable = APIService.shared.getUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { user in
                self.users.append(contentsOf: user)
                self.currentLastId = user.last?.id
            }
    }
}
