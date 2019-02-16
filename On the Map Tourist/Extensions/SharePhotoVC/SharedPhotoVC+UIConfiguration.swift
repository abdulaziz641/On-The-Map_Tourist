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
    
    //MARK: Configuring UI
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
    
    func deletePhoto() {
        
//        let attributedString = NSAttributedString(string: "Yes", attributes: [
//            NSAttributedString.Key.foregroundColor : UIColor.red
//            ])
        
        let imSureAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            self.appDelegate.dataController.viewContext.delete(self.sharedImage)
            try! self.appDelegate.dataController.viewContext.save()
            self.dismiss(animated: true, completion: nil)
        }
        
        let noImNotSureAction = UIAlertAction(title: "Cancel", style: .default)
        
        let confirmDeletionMessage = "Are you sure you want to delete the photo?"
        let confirmDeletionAlert = UIAlertController(title: "Confirm Deletion", message: confirmDeletionMessage, preferredStyle: .alert)
        confirmDeletionAlert.addAction(imSureAction)
        confirmDeletionAlert.addAction(noImNotSureAction)
        present(confirmDeletionAlert, animated: true, completion: nil)
    }
}
