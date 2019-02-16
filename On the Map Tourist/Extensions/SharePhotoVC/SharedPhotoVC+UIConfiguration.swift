//
//  SharedPhotoVC+UIConfiguration.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 16/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit
import Photos

extension SharePhotoViewController {
    
    //MARK: Configuring UI and gestures
    func configureGesureRecognizer() {
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        longTapGesture.minimumPressDuration = 0.9
        imageView.addGestureRecognizer(longTapGesture)
    }
    
    func hideToolBars(_ hide: Bool) {
        topToolBar.isHidden = hide
    }
    
    //MARK: handling long tap
    @objc func longTap(sender: UIGestureRecognizer){
        if sender.state == .began {
            let imageToSave = prepareImageForSaving()
            let shareImageActivityController = UIActivityViewController(activityItems: [imageToSave], applicationActivities: nil)
            shareImageActivityController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                if !completed {
                    // User canceled
                    guard (error == nil) else {
                        self.showAlert(title: "Failed", message: "There was an error saving the photo, kindly try again", buttonText: "Try Again")
                        return
                    }
                    return
                }
                // User completed activity
                self.showAlert(title: "Success", message: "Photo Saved Successfully", buttonText: "OK")
            }
            present(shareImageActivityController, animated: true, completion: nil)
        }
    }
}
