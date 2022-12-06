//
//  Media.swift
//  Plantful
//
//  Created by Jacob Perez on 11/28/22.
//

import UIKit


// Initialize media object for this image
// After media object has been initialized pass that into the create data body function
struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "images/jpeg"
        self.filename = "imagefile.jpg"
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
}

//uploadImageToServer()
