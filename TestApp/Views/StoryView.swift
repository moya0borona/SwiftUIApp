//
//  StoryViewTest.swift
//  TestApp
//
//  Created by Андрей Андриянов on 04.04.2025.
//

import SwiftUI

struct StoryView: View {
    @StateObject private var payState = PaidProState()
    @State private var currentIndex = 0
    @Environment(\.dismiss) private var dismiss
    @State private var showSaveOptions = false
    @State private var showSaveConfirmation = false
    @State private var saveMessage = ""
    @State private var showPaywall = false
    let stories = ["onboardingImage-2", "paywallImage", "mrp"]
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<stories.count, id: \.self) { index in
                    ZStack {
                        Image(stories[index])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                        if !payState.isPaid && index != 0 {
                            Color.black.opacity(0.3)
                            BlurView(style: .systemUltraThinMaterialDark)
                            VStack {
                                Image(systemName: "sparkles")
                                    .font(.system(size: 40))
                                    .foregroundColor(AppColors.watermelonRed)
                                    .padding()
                                Text("Unlock with PRO")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            VStack {
                HStack {
                    HStack {
                        Image(stories.first!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text("Username")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            print("Доп. меню")
                        }) {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 23))
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            dismiss()
                            print("dismiss")
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 23))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                Spacer()
                VStack {
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(0..<stories.count, id: \.self) { index in
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(index == currentIndex ? AppColors.watermelonRed : AppColors.watermelonRedPlus)
                        }
                    }
                    .padding()
                    Button(action: {
                        showSaveOptions = true
                    }) {
                        Text("Save")
                            .foregroundStyle(AppColors.white)
                            .frame(width: 358, height: 48)
                            .background(AppColors.watermelonRed)
                            .cornerRadius(24)
                    }
                    .confirmationDialog("Save media?", isPresented: $showSaveOptions, titleVisibility: .visible) {
                        Button("Save one media") {
                            if !payState.isPaid && currentIndex != 0 {
                                saveMessage = "Available only for PRO"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    showPaywall = true
                                }
                            } else {
                                ImageStorySaver.saveImage(named: stories[currentIndex])
                                saveMessage = "Media saved"
                                showSaveConfirmation = true
                            }
                        }
                        if payState.isPaid {
                            Button("Save all media (\(stories.count))") {
                                ImageStorySaver.saveImages(stories)
                                saveMessage = "Saved"
                                showSaveConfirmation = true
                            }
                        }
                        
                        Button("Cancel", role: .cancel) {}
                    }
                    .alert(saveMessage, isPresented: $showSaveConfirmation) {
                        Button("Ок", role: .cancel) {}
                    }
                }
            }
        }
        .background(Color.black.ignoresSafeArea()) // Чёрный фон
        .sheet(isPresented: $showPaywall) {
            PaywallView()
        }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    StoryView()
}
