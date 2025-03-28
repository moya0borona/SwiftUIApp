//
//  TabView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 25.03.2025.
//

import SwiftUI


struct TabBarView: View {
//    @StateObject private var tabBarState = TabBarState()
    @State private var tabSelection = "Main"
    @State private var isTabBarHidden = false
//    @Environment(\.dismiss) var dissmiss
//    @Environment(\.presentationMode) var presentationMode
    let tabs = ["Main","Collections","Upscale","Settings"]
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $tabSelection) {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabSelection) {
                MainView()
                    .tabBarHidden(false)
//                    .environmentObject(tabBarState)
                    .tag("Main")
//                    .onDisappear {
//                        print("TabBarView disappeared")
//                    }
                Text("Collections View")
                    .tag("Collections")
                Text("Upscale View")
                    .tag("Upscale")
                Text("Settings View")
                    .tag("Settings")
            }
            .onPreferenceChange(TabBarVisibilityPreferenceKey.self) { value in
                            withAnimation {
                                isTabBarHidden = value
                            }
                        }
//            .onChange(of: tabSelection) { newTab in
//                print("Switched to \(newTab)")
//            }
//            .onAppear {
//                           print("TabBarView appeared")
//                       }
//                       .onDisappear {
//                           print("TabBarView disappeared")
//                       }
//            }
                         
            if !isTabBarHidden {
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
                //                .transition(.move(edge: .bottom)) // Анимация скрытия TabBar
                //                .animation(.easeInOut(duration: 0.1), value: isTabBarHidden)
            }
            }
        }
        
        }
    }

struct BarItem: View {
    let tab: String
    @Binding var tabSelection: String
//    @Binding var isTabBarHidden: Bool
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
                    
//                        isTabBarHidden = (tab == "Main")
//                    isTabBarHidden = false
                    
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

