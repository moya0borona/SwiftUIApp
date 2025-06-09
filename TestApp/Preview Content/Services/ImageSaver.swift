//
//  ImageSaver.swift
//  TestApp
//
//  Created by Андрей Андриянов on 29.03.2025.
//

import UIKit



class ImageSaver: NSObject {
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveToPhotoAlbumFinished), nil)
    }
        @objc func saveToPhotoAlbumFinished(_ image: UIImage?, _ error: Error?, _ context: UnsafeMutableRawPointer?) {
            print("Save finished")
        }
    }




//class ImageSaver {
//    // Метод для сохранения изображения в галерею
//    static func saveImageToGallery(imageName: String, completion: @escaping (Bool) -> Void) {
//        // Преобразуем имя изображения в UIImage
//#if os(iOS)
//        if let uiImage = UIImage(named: imageName) {
//            // Попытка сохранить изображение в фотогалерею
//            UIImageWriteToSavedPhotosAlbum(uiImage, nil, { image, error, contextInfo in
//                if let error = error {
//                    print("Ошибка при сохранении: \(error.localizedDescription)")
//                    completion(false) // Ошибка при сохранении
//                } else {
//                    print("Изображение успешно сохранено в галерею!")
//                    completion(true) // Успешно сохранено
//                }
//            }, nil)
//        } else {
//            print("Изображение не найдено!")
//            completion(false) // Если изображение не найдено
//        }
//#else
//        completion(false)
//#endif
//    }
//}

