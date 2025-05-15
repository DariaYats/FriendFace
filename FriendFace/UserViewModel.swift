//
//  UserViewModel.swift
//  FriendFace
//
//  Created by Дарья Яцынюк on 14.05.2025.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []

    func fetchUsers() async {
        guard users.isEmpty else { return }

        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
            self.users = decodedUsers
        } catch {
            print("Failed to fetch or decode data: \(error.localizedDescription)")
        }
    }
}
