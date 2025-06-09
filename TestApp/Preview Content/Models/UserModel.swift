//
//  UserModel.swift
//  TestApp
//
//  Created by Андрей Андриянов on 26.03.2025.
//

import Foundation

struct User: Identifiable {
    let id = UUID()  
    let name: String
    let imageName: String
}
