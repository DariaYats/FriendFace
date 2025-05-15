//
//  ContentView.swift
//  FriendFace
//
//  Created by Дарья Яцынюк on 14.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: DetailUserView(user: user)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.company)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Circle()
                                .fill(user.isActive ? .green : .gray)
                                .frame(width: 12, height: 12)
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}
