//
//  ViewController.swift
//  ISpy
//
//  Created by Erin Vincent on 6/21/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        updateZoomFor(size: view.bounds.size)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / image.bounds.width
        let heightScale = size.height / image.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
    }
    
}

