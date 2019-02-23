//
//  FavPhotoCollectionVC+FlowLayout.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 22/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension FavoritePhotosViewController {
    
    //Mark: UICollectionViewDelegateFlowLayout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //Mark: UI configuration
    func configureFlowLayout() {
        let space: CGFloat = 3.0
        let dimension = (view.frame.width - 2) / 3
        favPhotosFlowLayout.minimumInteritemSpacing = space
        favPhotosFlowLayout.minimumLineSpacing = dimension
        favPhotosFlowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
}
