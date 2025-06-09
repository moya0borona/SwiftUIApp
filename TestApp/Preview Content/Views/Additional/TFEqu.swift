//
//  TFEqu.swift
//  TestApp
//
//  Created by Андрей Андриянов on 29.03.2025.
//

import Foundation
import SwiftUI

struct User1: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchUsersView: View {
    @State private var searchText = ""
    
    let users: [User1] = [
        User1(name: "Боб"),
        User1(name: "Bob"),
        User1(name: "Charlie"),
        User1(name: "David"),
        User1(name: "Eve"),
        User1(name: "Frank"),
        User1(name: "Grace"),
        User1(name: "Hank"),
        User1(name: "Ivy")
    ]
    
    var filteredUsers: [User1] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search for a profile...", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            List(filteredUsers) { user in
                Text(user.name)
            }
        }
        .padding()
    }
}

#Preview {
    SearchUsersView()
}

