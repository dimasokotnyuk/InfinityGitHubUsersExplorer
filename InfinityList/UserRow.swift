//
//  UserRow.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: user.avatarUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 44, height: 44)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                case .failure(let error):
                    Image(systemName: "photo.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            Text(user.name)
        }
    }
}

#Preview {
    UserRow(user: User.sample)
}
