//
//  OpenStory.swift
//  TestApp
//
//  Created by Андрей Андриянов on 27.03.2025.
//

import SwiftUI
let onboardingPages: [User] = [
    User(name: "Story", imageName: "image_2"),
    User(name: "Story", imageName: "image_2")
]

struct OpenStory: View {
    let user: User
    @State private var currentPageCount = 0
    @State private var isPresented = false
    @State private var canProceed = false
    var body: some View {
        ZStack {
            TabView(selection: $currentPageCount) {
                ForEach(onboardingPages.indices, id: \.self) { index in
                    OnboardingPage(data: onboardingPages[index], isPresented: $isPresented)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            VStack {
                Spacer()
                PageIndicator(currentPage: currentPageCount)
                    .padding()
                Button(action: {
                })
                {
                    Text("Save")
                        .foregroundStyle(Color(hex: "#FFFFFF"))
                        .frame(width: 358, height: 48)
                        .background(Color(hex: "#C83E3E"))
                        .cornerRadius(24)
                }
            }
        }.background(.black)
    }
}

struct PageIndicator: View {
    var currentPage: Int
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<onboardingPages.count, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(index == currentPage ? Color(hex: "#C83E3E") : Color(hex: "#C83E3E45"))
            }
        }
    }
}
struct OnboardingPage: View {
    let data: User
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        ZStack {
            Image(data.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            HStack {
                Image(data.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red.opacity(0.2), lineWidth: 2))
                Text("@\(data.name)")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .frame(width: 87, height: 52, alignment: .leading)
                    .cornerRadius(10)
                    .padding(8)
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 23))
                })
                .padding()
                Button(action: {
                    isPresented = false
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 23))
                })
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    OpenStory(user: User(name: "bob", imageName: "mrp"))
}
