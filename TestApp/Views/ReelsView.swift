//
//  ReelsView.swift
//  TestApp
//
//  Created by Андрей Андриянов on 29.03.2025.
//

import SwiftUI

struct ReelsView: View {
    let users: [User]
    @State private var showAlert = false
    @State private var image: UIImage? = UIImage(named: "mrp")
    @State private var isImageSaved = false
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 3), spacing: 2) {
            ForEach(users) { user in
                ZStack(alignment: .bottomTrailing) {
                    Image(user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 114, height: 200)
                        .cornerRadius(10)
                        .clipped()
                    Button(action: {
                        showAlert.toggle()
                    }) {
                        Image(systemName: "arrow.down.to.line")
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .background(AppColors.blackPlus)
                            .cornerRadius(8)
                    }.padding()
                        .alert(isPresented: $showAlert) {
                                      Alert(
                                          title: Text("Сохранить изображение?"),
                                          message: Text("Вы хотите сохранить это изображение в галерею?"),
                                          primaryButton: .default(Text("Да")) {
                                              guard let image = image else { return }
                                              let imageSaver = ImageSaver()
                                              imageSaver.writeToPhotoAlbum(image: image)
                                              isImageSaved = true
                                          },
                                          secondaryButton: .cancel {
                                              // Действия при отмене
                                          }
                                      )
                                  }
                }
            }
        }
    }
}
