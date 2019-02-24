//
//  CollectionVC+Delegate.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 15/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension PhotoAlbumViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    //Mark: Delegate Functions
    func numberOfSections(in collectionView: UICollectionView) -> Int { return (fetchedResultsController.sections?.count)!}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryBoardId.FlickrCellResueIdentifier.rawValue, for: indexPath) as! FlickrPhotoCell
        cell.delegate = self
        let photo = fetchedResultsController.object(at: indexPath)
        if let imageData = photo.photoData, let image = UIImage(data: imageData) {
            cell.currentPhoto = photo
            cell.configureCell(with: image, like: photo.isLiked)
            DispatchQueue.main.async {
                self.internetIndicator.stopAnimating()
                self.fetchingImagesLabel.isHidden = true
            }
        } else if let url = URL(string: photo.photoURL ?? "") {
            NetworkClient.downloadImage(url: url) { (isSucceeded, data, _) in
                
                guard (isSucceeded == true) else {
                    return
                }
                
                //let photo = Photo()
                photo.photoData = data
                cell.currentPhoto = photo
                DispatchQueue.main.async {
                    cell.configureCell(with: UIImage(data: data!)!, like: photo.isLiked)
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shareImageVC = storyboard?.instantiateViewController(withIdentifier: StoryBoardId.ShareImageVC.rawValue) as! SharePhotoViewController
        shareImageVC.fetchedResultsController = fetchedResultsController
        shareImageVC.sharedImage = fetchedResultsController.object(at: indexPath)
        present(shareImageVC, animated: true, completion: nil)
    }
}
