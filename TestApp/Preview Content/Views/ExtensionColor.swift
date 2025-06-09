//
//  ExtensionColor.swift
//  TestApp
//
//  Created by Андрей Андриянов on 25.03.2025.
//

import Foundation
import SwiftUICore

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red, green, blue, alpha: Double
        switch hexSanitized.count {
        case 6:
            red   = Double((rgb >> 16) & 0xFF) / 255.0
            green = Double((rgb >>  8) & 0xFF) / 255.0
            blue  = Double( rgb        & 0xFF) / 255.0
            alpha = 1.0
        case 8:
            red   = Double((rgb >> 24) & 0xFF) / 255.0
            green = Double((rgb >> 16) & 0xFF) / 255.0
            blue  = Double((rgb >>  8) & 0xFF) / 255.0
            alpha = Double( rgb        & 0xFF) / 255.0
        default:
            red = 0; green = 0; blue = 0; alpha = 1.0
        }
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
