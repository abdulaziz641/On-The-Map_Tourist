//
//  FlickrPhotoCell.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 15/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoCell: UICollectionViewCell {
    
    //MARK: Cell Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var downloadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var likePhotoButton: UIButton!
    
    var isLiked: Bool = false
    var currentPhoto: Photo!
    
    weak var delegate: PhotoAlbumViewControllerDelegate!
    
    // MARK: Prepare for use
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        isLiked = false
        downloadingIndicator.startAnimating()
        currentPhoto = nil
    }
    
    @IBAction func likePhotoButtonPressed(_ sender: Any) {
        shouldLikePhoto(isLiked, photo: currentPhoto)
    }
    
    //MARK: Configure UI
    func configureUI(with image: UIImage, like: Bool) {
        imageView.image = image
        isLiked = like
        downloadingIndicator.stopAnimating()
        shouldLikePhoto(like, photo: currentPhoto)
    }
    
    //MARK: like / dislike photo
    func shouldLikePhoto(_ like: Bool, photo: Photo) {
        //likePhotoButton.isHidden = false
        let image = like ? UIImage(named: "like-red-filled-50.png") : UIImage(named: "like_black-50.png")
        likePhotoButton.setImage(image, for: .normal)
        like ? delegate.likePhoto(photo: photo) : delegate.deslikePhoto(photo: photo)
    }
}
