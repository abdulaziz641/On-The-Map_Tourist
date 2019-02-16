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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: properties and IBOutlets
    var sharedImage: Photo!
    
    var fetchedResultsController: NSFetchedResultsController<Photo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
    }
    
    //MARK: IBActions
    @IBAction func buttonIsPressed(_ sender: UIBarButtonItem) {
        switch sender.title {
        case "Delete":
            deletePhoto()
        case "Cancel":
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
}
