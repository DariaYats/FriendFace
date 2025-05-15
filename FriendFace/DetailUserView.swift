//
//  DetailUserView.swift
//  FriendFace
//
//  Created by Дарья Яцынюк on 15.05.2025.
//

import SwiftUI

struct DetailUserView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(user.name)
                    .font(.largeTitle)
                    .bold()

                HStack {
                    Text("Age: \(user.age)")
                    Spacer()
                    Text(user.isActive ? "Online" : "Offline")
                        .foregroundColor(user.isActive ? .green : .gray)
                }
                .font(.subheadline)

                Text("Company: \(user.company)")
                    .font(.subheadline)

                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Friends:")
                    .font(.headline)
                ForEach(user.friends) { friend in
                    Text(friend.name)
                        .padding(.leading, 8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    DetailUserView(user: User(id: "one", isActive: true, name: "Daria", age: 35, company: "Huma", email: "daria35@gmail.com", address: "Greene street", about: "something about", registered: "one year ago", tags: ["#work"], friends: [Friend(id: "two", name: "Asya")]))
}
