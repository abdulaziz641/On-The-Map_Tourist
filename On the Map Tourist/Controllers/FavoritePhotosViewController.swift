//
//  FavoritePhotosViewController.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 17/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
import CoreData

class FavoritePhotosViewController: UICollectionViewController {
    
    //MARK: IBOutlets and properties
    @IBOutlet weak var favPhotosFlowLayout: UICollectionViewFlowLayout!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var fetchedResultsController: NSFetchedResultsController<Photo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFetchedResultsController()
    }
    
    //MARK: fetch request
    private func setupFetchedResultsController() {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "photoURL", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "isLiked == %@", NSNumber(value: true))
        fetchRequest.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.dataController.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            showAlert(title: "Failure", message: "The fetch could not be performed", buttonText: "OK")
        }
    }
}

extension FavoritePhotosViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) { }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) { collectionView.reloadData() }
    
}
