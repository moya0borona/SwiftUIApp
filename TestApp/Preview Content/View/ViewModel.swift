//
//  ViewModel.swift
//  TestApp
//
//  Created by Андрей Андриянов on 27.03.2025.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var selectedTab: String = "Posts"
    @Published var users: [User] = (1...16).map { _ in
        User(name: "Story", imageName: "mrp")
    }
    
    func onEditButtonTapped() {
        print("Edit button was tapped")
    }
}
