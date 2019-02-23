//
//  FavPhotoCell.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 21/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

class FavPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var isLiked: Bool = false
    var currentPhoto: Photo!
    
    weak var delegate: PhotoAlbumViewControllerDelegate!
    
    // MARK: Prepare for use
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    //MARK: Configure Cell
    func configureCell(with image: UIImage, like: Bool) {
        imageView.image = image
    }
}
