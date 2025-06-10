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
