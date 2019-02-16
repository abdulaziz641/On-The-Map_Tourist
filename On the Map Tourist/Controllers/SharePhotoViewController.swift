//
//  SharePhotoViewController.swift
//  On the Map Tourist
//
//  Created by Abdulaziz Alsaloum on 16/02/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit

import CoreData
class SharePhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: properties and IBOutlets
    var sharedImage: Photo!
    
    var fetchedResultsController: NSFetchedResultsController<Photo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurenavigationBar()
        configureImage()
    }
}
