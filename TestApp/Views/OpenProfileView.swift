//
//  ProfilesView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 26.03.2025.
//

import SwiftUI

struct OpenProfileView: View {
    @EnvironmentObject var tabBarState: TabBarState
    @State var selectedTab: String = "Posts"
    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showPaywall = false
    @Namespace var animation
    let user: User

    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(
                    title: "Profile",
                    leadingButtonAction: {
                        dismiss()
                    },
                    trailingButtonAction: {
                        
                    },
                    trailingButton: AnyView(
                        Button(action: {
                            showPaywall = true
                        }) {
                            Image("proButton2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                        }
                    )
                )
            }.sheet(isPresented: $showPaywall) {
                PaywallView()
            }
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    Image(user.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 109, height: 109)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.red.opacity(2), lineWidth: 2)
                        )
                    VStack {
                        HStack {
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                VStack {
                                    Text(user.name)
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(AppColors.eerieBlack)
                                        .fontWeight(.bold)
                                    
                                    Text("@\(user.name)")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.gray)
                                }
                                .padding()
                            }
                            .frame(width: 169, height: 52, alignment: .leading)
                            .background(AppColors.spanishGrayPlus)
                            .cornerRadius(10)
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                HStack {
                                    Image(systemName: "bookmark.fill")
                                        .foregroundStyle(AppColors.watermelonRed)
                                }
                            }
                            .frame(width: 52, height: 52, alignment: .center)
                            .background(AppColors.spanishGrayPlus)
                            .cornerRadius(10)
                        }
                        VStack {
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                HStack {
                                    Text("Save avatar")
                                        .font(.system(size: 17, weight: .regular))
                                        .fontWeight(.bold)
                                        .foregroundStyle(AppColors.watermelonRed)
                                    Image(systemName: "arrow.down.to.line")
                                        .foregroundStyle(AppColors.watermelonRed)
                                }
                            }
                            .frame(width: 229, height: 48, alignment: .center)
                            .background(AppColors.spanishGrayPlus)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.users) { post in
                            NavigationLink(destination: StoryView().navigationBarHidden(true)
                            ) {
                                VStack {
                                    Image(post.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 66, height: 66)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                        )
                                    Text(post.name)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                HStack {
                    TabBarButton(text: "Posts", selectedTab: $selectedTab)
                    TabBarButton(text: "Reels", selectedTab: $selectedTab)
                }
                ScrollView {
                    switch selectedTab {
                    case "Posts":
                        PostsView(users: viewModel.users)
                    case "Reels":
                        ReelsView(users: viewModel.users)
                    default:
                        Text("Выберите вкладку")
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedTab = text
            }
        } label: {
            VStack(spacing: 8) {
                Text(text)
                    .foregroundColor(selectedTab == text ? .primary : .gray)
                Rectangle()
                    .fill(selectedTab == text ? Color.primary : Color.clear)
                    .frame(height: 2)
            }
        }
    }
}

#Preview {
    OpenProfileView(user: User(name: "Alice", imageName: "image_2")).environmentObject(TabBarState())
    
}
