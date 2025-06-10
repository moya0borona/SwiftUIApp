//
//  TabView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 25.03.2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var tabBarState = TabBarState()
    @State private var tabSelection = "Main"
    let tabs = ["Main","Collections","Upscale","Settings"]
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
            ZStack(alignment: .bottom) {
                TabView(selection: $tabSelection) {
                    MainView()
                        .environmentObject(tabBarState)
                        .tag("Main")
                    Text("Collections View")
                        .tag("Collections")
                    Text("Upscale View")
                        .tag("Upscale")
                    SettingsView()
                        .tag("Settings")
                }
                if !tabBarState.isHidden {
                        HStack {
                            ForEach(tabs, id: \.self) { tab in
                                Spacer()
                                BarItem(tab: tab, tabSelection: $tabSelection)
                                Spacer()
                            }
                        }
                        .frame(width: 358, height: 66)
                        .background(Color(hex: "#070A0F0A"))
                        .cornerRadius(10)
                }
            }
            .environmentObject(tabBarState)
    }
}

struct BarItem: View {
    let tab: String
    @Binding var tabSelection: String
    let tabIcons: [String: String] = [
        "Main": "person.2.fill",
        "Collections": "star.fill",
        "Upscale": "wand.and.stars",
        "Settings": "gearshape.fill"
    ]
    var body: some View {
        ZStack {
            Button {
                withAnimation(.bouncy) {
                    tabSelection = tab
                }
            } label: {
                VStack {
                    Image(systemName: tabIcons[tab] ?? "questionmark.circle")
                    Text(tab)
                        .font(.caption2)
                }
                .foregroundColor(tabSelection == tab ? Color(hex: "#191919") : Color(hex: "#070A0F66"))
            }
        }
    }
}

#Preview {
    TabBarView()
}

