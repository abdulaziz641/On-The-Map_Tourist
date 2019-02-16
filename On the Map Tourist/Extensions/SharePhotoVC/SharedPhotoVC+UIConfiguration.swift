//
//  SharedPhotoVC+UIConfiguration.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 16/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension SharePhotoViewController {
    
    //MARK: Configuring navigationBar
    func configurenavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(sharePhoto))
    }
    
    func configureImage() {
        if let image = UIImage(data: sharedImage.photoData!) {
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
        } else {
            showAlert(title: "Oh no", message: "There was an issue loading the image", buttonText: "Try again")
        }
    }
    
    @objc func sharePhoto() {
        print("Sharing Photo")
    }
}
