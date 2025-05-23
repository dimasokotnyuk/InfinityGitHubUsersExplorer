//
//  LoaderView.swift
//  InfinityList
//
//  Created by Дмитро Сокотнюк on 23.05.2025.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry" : "Loading...")
            .foregroundColor(isFailed ? .red : .green)
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .green))
    }
}

#Preview {
    LoaderView(isFailed: false)
}
