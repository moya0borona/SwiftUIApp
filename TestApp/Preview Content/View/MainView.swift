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
//    @Binding var isTabBarHidden: Bool
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
                ZStack(alignment: .trailing) {
                    TextField("", text: $textInput, prompt: Text("User name or URL").foregroundColor(.gray))
                        .padding(.leading, 36)
                        .padding(.trailing, 40)
                        .frame(height: 50)
                        .background(Color.white)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 10)
                                Spacer()
                                
                                Button(action: {
                                    if let clipboardText = UIPasteboard.general.string {
                                        textInput = clipboardText
                                    }
                                }) {
                                    Image(systemName: "doc.on.doc")
                                        .foregroundColor(Color(hex: "#C83E3E"))
                                        .padding(8)
                                }
                                .background(Color.white)
                                .cornerRadius(8)
                                .padding(.trailing, 8)
                            }
                        )
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal, 16)
                    
                }
                .padding(.bottom, 28)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(users) { profile in
                        NavigationLink(destination: OpenProfileView(user: profile)
                            .onAppear
                                       {
                            tabBarState.isHidden = true
                        }
//                            .onDisappear {
//                            tabBarState.isHidden = false
//                        }
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
                .padding(.bottom, 31)
                HStack {
                    if users.count >= 8 {
                        Button(action: {
                            
                        }) {
                            HStack {
                                Text("See all")
                                Image(systemName: "chevron.forward")
                            }
                            .foregroundStyle(Color(hex: "#191919"))
                        }

                    }
                }
                .padding()
                
            }
            
            .ignoresSafeArea().navigationTitle("Story Viewer")
                .navigationBarItems(trailing: Image("proButton")
                    .resizable().scaledToFit().frame(width: 82, height: 32))
.onAppear {
    print("MAINo_onAppear")
//    if tabBarState.isHidden == false {
            tabBarState.isHidden = false
//        }  // Показываем TabBar, когда возвращаемся в MainView
}
.onDisappear {
//    tabBarState.isHidden = true
    print("MAIN_onDisappear")
}
                
                
        }
            }
  
        }

               
//        .fullScreenCover(isPresented: $shouldShowOnboarding) {
//            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
//        }
        



#Preview {
    MainView().environmentObject(TabBarState())
}
