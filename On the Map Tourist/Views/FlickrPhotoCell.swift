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
    
    // MARK: Prepare for use
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        if !downloadingIndicator.isAnimating {
            downloadingIndicator.startAnimating()
        }
    }
}
