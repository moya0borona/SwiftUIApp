////
////  SettingsHideBar.swift
////  TestApp
////
////  Created by Андрей Андриянов on 28.03.2025.
////
//
//import SwiftUI
//
//class TabBarState: ObservableObject {
//    @Published var isHidden: Bool = false
//}
//
//
//struct TabBarView: View {
//    @StateObject private var tabBarState = TabBarState()
//    @State private var tabSelection = "Main"
//
//    init() {
//        UITabBar.appearance().isHidden = true
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            TabView(selection: $tabSelection) {
//                MainView()
//                    .environmentObject(tabBarState) // Передаём в MainView
//                    .tag("Main")
//
//                Text("Collections View")
//                    .tag("Collections")
//                Text("Upscale View")
//                    .tag("Upscale")
//                Text("Settings View")
//                    .tag("Settings")
//            }
//            
//            if !tabBarState.isHidden {
//                HStack {
//                    ForEach(["Main", "Collections", "Upscale", "Settings"], id: \.self) { tab in
//                        Spacer()
//                        BarItem(tab: tab, tabSelection: $tabSelection)
//                        Spacer()
//                    }
//                }
//                .frame(width: 358, height: 66)
//                .background(Color(hex: "#070A0F0A"))
//                .cornerRadius(10)
//            }
//        }
//    }
//}
//
//
//struct MainView: View {
//    @EnvironmentObject var tabBarState: TabBarState
//    @State private var navigateToProfile = false
//
//    var body: some View {
//        VStack {
//            Text("Main View")
//            
//            Button("Go to Profile") {
//                tabBarState.isHidden = true  // Скрываем TabBar
//                navigateToProfile = true
//            }
//            
//            NavigationLink(destination: ProfileView().onAppear {
//                tabBarState.isHidden = true
//            }.onDisappear {
//                tabBarState.isHidden = false
//            }, isActive: $navigateToProfile) {
//                EmptyView()
//            }
//        }
//        .onAppear {
//            tabBarState.isHidden = false  // Показываем TabBar, когда возвращаемся в MainView
//        }
//    }
//}
