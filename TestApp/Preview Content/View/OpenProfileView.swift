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
    @Namespace var animation
//    @Binding var isTabBarHidden: Bool
    let user: User
    let users: [User] = [
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2"),
        User(name: "Story", imageName: "onboardingImage-2")
    ]
    var body: some View {
        NavigationStack {
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
                                    .foregroundStyle(Color(hex: "#191919"))
                                    .fontWeight(.bold)
                                
                                Text("@\(user.name)")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.gray)
                                    
                            }
                            .padding()
                        }
                        
                        .frame(width: 169, height: 52, alignment: .leading)
                        .background(Color(hex: "#9D9C9C14"))
                        .cornerRadius(10)
                        
                        Button { 
                            print("Edit button was tapped")
                        } label: {
                            HStack {
                                Image(systemName: "bookmark.fill")
                                    .foregroundStyle(Color(hex: "#C83E3E"))
                            }
                            
                        }
                        .frame(width: 52, height: 52, alignment: .center)
                        .background(Color(hex: "#9D9C9C14"))
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
                                            .foregroundStyle(Color(hex: "#C83E3E"))
                                        Image(systemName: "arrow.down.to.line")
                                            .foregroundStyle(Color(hex: "#C83E3E"))
                                        
                                    }
                                    
                                }
                                .frame(width: 229, height: 48, alignment: .center)
                                .background(Color(hex: "#9D9C9C14"))
                                .cornerRadius(10)
                            }
                        }
             
                   
            }
               
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(users) { post in
                            NavigationLink(destination: OpenStory(user: User(name: "1223", imageName: "image_2")).navigationBarHidden(true)
                                
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
                    TabBArButtun(text: "Posts", animation: animation, selectedTab: $selectedTab)
                    TabBArButtun(text: "Reels", animation: animation, selectedTab: $selectedTab)
                }
                ScrollView(showsIndicators: false) {
                    ZStack {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2, content: {
                            ForEach(users) { post in
                                GeometryReader { proxi in
                                    let width = proxi.frame(in: .global).width
                                    Image(post.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: width, height: 114, alignment: .center)
                                        .cornerRadius(0)
                                }
                                .frame(height: 114)
                                .cornerRadius(12)
                            }
                        })
                    }
                }
//                Spacer()
            }
            .padding()
            .navigationBarTitle(user.name, displayMode: .inline)
            .navigationBarItems(trailing: Image("proButton2")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32))
//                    .onAppear { tabBarState.isHidden = true } // Скрываем TabBar при входе
//                    .onDisappear { tabBarState.isHidden = false }
        }
            
        }
    }

    
struct TabBArButtun: View {
    var text: String
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                selectedTab = text
            }
        }, label: {
            VStack(spacing: 12) {
                Text(text)
                    .foregroundColor(selectedTab == text ? .primary : .gray)
                ZStack {
                    if selectedTab == text {
                        Rectangle()
                            .fill(Color.primary)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                    }
                }
                .frame(height: 1)
            }
        })
    }
    }


#Preview {
    OpenProfileView(user: User(name: "Alice", imageName: "image_2")).environmentObject(TabBarState())
        
}
