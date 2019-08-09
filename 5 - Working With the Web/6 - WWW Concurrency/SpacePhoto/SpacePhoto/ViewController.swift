//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Erin Vincent on 8/9/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let photoInfoController = PhotoInfoController()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        }
    }

}

