//
//  MainView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 26.03.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tabBarState: TabBarState
    @AppStorage("79xt546scг5641shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @State private var tabSelection = 0
    @State private var textInput = ""
    @State private var navigateToSecondView = false
    @State private var showPaywall = false

    let users: [User] = [
        User(name: "Profile_1", imageName: "onboardingImage-2"),
        User(name: "Profile_2", imageName: "onboardingImage-2"),
        User(name: "Profile_3", imageName: "onboardingImage-2"),
        User(name: "Profile_4", imageName: "onboardingImage-2"),
        User(name: "Profile_5", imageName: "onboardingImage-2"),
        User(name: "Profile_6", imageName: "onboardingImage-2"),
        User(name: "Profile_7", imageName: "onboardingImage-2"),
        User(name: "Profile_8", imageName: "onboardingImage-2")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Watch stories and find users")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.bottom, 6)
                Text("You will always remain anonymous")
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 28)
                SearchTextField(textInput: $textInput)
                    .padding(.bottom, 28)
                    .onTapGesture {
                        print("TAPTF")
                        navigateToSecondView = true
                    }.navigationDestination(isPresented: $navigateToSecondView, destination: { SearchView().navigationBarHidden(true)
                            .onAppear() {
                                tabBarState.isHidden = true
                            }
                    })
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(users) { profile in
                        NavigationLink(destination: OpenProfileView(user: profile)
                            .onAppear
                                       {
                            tabBarState.isHidden = true
                        }.navigationBarHidden(true)
                        ) {
                            VStack {
                                Image(profile.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 66, height: 66)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    )
                                Text(profile.name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 40)
                
                HStack {
                    if users.count >= 8 {
                        Button(action: {
                        }) {
                            HStack {
                                Text("See all")
                                Image(systemName: "chevron.forward")
                            }
                            .foregroundStyle(AppColors.eerieBlack)
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea().navigationTitle("Story Viewer")
            .navigationBarItems(trailing: Image("proButton")
                .resizable().scaledToFit().frame(width: 82, height: 32))
            .onAppear {
                print(tabBarState.isHidden)
                tabBarState.isHidden = false
            }
            .onDisappear {
                print("MAIN_onDisappear")
            }
        }
    }
}
#Preview {
    MainView().environmentObject(TabBarState())
}
