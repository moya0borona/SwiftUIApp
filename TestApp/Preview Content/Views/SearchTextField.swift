//
//  SearchTextField.swift
//  TestApp
//
//  Created by Андрей Андриянов on 28.03.2025.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var textInput: String
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("", text: $textInput, prompt: Text("User name or URL")
                .foregroundColor(.gray)
            )
            .padding(.leading, 36)
            .padding(.trailing, 40)
            .frame(height: 50)
            .background(Color.gray.opacity(0.1))

            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    Spacer()
                    Button(action: {
                        if let clipboardText = UIPasteboard.general.string {
                            textInput = clipboardText
                        } else {
                            textInput = ""
                        }
                    }) {
                        if textInput.isEmpty {
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(Color(hex: "#C83E3E"))
                                .padding(8)
                                .background(Color.gray.opacity(0.1))
                        } else {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color(hex: "#C83E3E"))
                                .padding(8)
                                .background(Color.gray.opacity(0.1))
                        }
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
    }
}

#Preview {
    SearchTextField(textInput: .constant(""))
}
