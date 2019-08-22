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
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url, completionHandler: {(data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.imageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        print("here")
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        print("there")
                        self.copyrightLabel.isHidden = true
                    }
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
            
        })
        task.resume()
    }
}

