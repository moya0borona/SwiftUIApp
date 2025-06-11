//
//  Search.swift
//  TestApp
//
//  Created by Андрей Андриянов on 28.03.2025.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var tabBarState: TabBarState
    @State private var textInput = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            CustomNavigationBar(
                title: "Search",
                leadingButtonAction: {
                    dismiss()
                    tabBarState.isHidden = false
                },
                trailingButtonAction: {
                },
                trailingButton: AnyView(
                    Button(action: {
                    }) {
                        Image("proButton2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                )
            )
            SearchTextField(textInput: $textInput)
                .padding(.bottom, 20)
            Button(action: {
                
            })
            {
                Text("Search")
                    .foregroundStyle(AppColors.white)
                    .frame(width: 358, height: 48)
                    .background(AppColors.watermelonRed)
                    .cornerRadius(24)
            }
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
