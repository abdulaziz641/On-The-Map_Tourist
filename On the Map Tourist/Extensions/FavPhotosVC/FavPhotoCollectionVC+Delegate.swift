//
//  FavPhotoCollectionVC+Delegate.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 22/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension FavoritePhotosViewController {
    
    //Mark: Delegate Functions
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return (fetchedResultsController.sections?.count)!}
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoardId.FavPhotoCellReuseIdentifier.rawValue, for: indexPath) as! FavPhotoCell
        let photo = fetchedResultsController.object(at: indexPath)
        if let imageData = photo.photoData, let image = UIImage(data: imageData) {
            cell.currentPhoto = photo
            cell.configureCell(with: image, like: photo.isLiked)
            DispatchQueue.main.async {
                cell.configureCell(with: image, like: photo.isLiked)
            }
        }
        return cell
    }
}
