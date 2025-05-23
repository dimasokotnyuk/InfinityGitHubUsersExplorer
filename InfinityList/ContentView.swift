//
//  ContentView.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject private var viewModel = UserViewModel()
    
        var body: some View {
            NavigationView() {
                List {
                    ForEach(viewModel.users) { user in
                        UserRow(user: user)
                    }
                    LoaderView(isFailed: viewModel.isRequestFailed)
                        .onAppear(perform: fetchData)
                        .onTapGesture(perform: onTapLoadView)
                }
            }
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.inline)
        }
    
    private func fetchData() {
        viewModel.getUsers()
    }
    
    private func onTapLoadView() {
        if viewModel.isRequestFailed {
            viewModel.isRequestFailed = false
            fetchData()
        }
    }
}

#Preview {
    ContentView()
}
