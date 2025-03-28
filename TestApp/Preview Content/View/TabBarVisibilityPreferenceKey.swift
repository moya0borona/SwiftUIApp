//
//  TabBarVisibilityPreferenceKey.swift
//  TestApp
//
//  Created by Андрей Андриянов on 28.03.2025.
//

import SwiftUI

struct TabBarVisibilityPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    func tabBarHidden(_ hidden: Bool) -> some View {
        preference(key: TabBarVisibilityPreferenceKey.self, value: hidden)
    }
}
