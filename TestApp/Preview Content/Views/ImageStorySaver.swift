//
//  ImageSaver.swift
//  TestApp
//
//  Created by Андрей Андриянов on 08.04.2025.
//

// File: ImageSaver.swift

import UIKit

struct ImageStorySaver {
    static func saveImage(named name: String) {
        guard let image = UIImage(named: name) else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }

    static func saveImages(_ names: [String]) {
        for name in names {
            saveImage(named: name)
        }
    }
}
