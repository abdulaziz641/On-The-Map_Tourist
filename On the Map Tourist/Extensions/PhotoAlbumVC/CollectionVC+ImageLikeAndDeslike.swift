//
//  CollectionVC+ImageLikeAndDeslike.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 18/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension PhotoAlbumViewController: PhotoAlbumViewControllerDelegate {
    
    //MARK: Handle photo like and deslike
    func likePhoto(photo: Photo) {
        photo.isLiked = true
    }
    
    func deslikePhoto(photo: Photo) {
        photo.isLiked = false
    }
}
