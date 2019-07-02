//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Erin Vincent on 7/2/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var picture: UIImageView!
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = picture.image else { return }
        let activityController =
            UIActivityViewController(activityItems: [image],
                                     applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView
            = sender
        
        present(activityController, animated: true, completion: nil)
    }
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "http://www.apple.com"){
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
            print("User selected Camera action")
        })
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            print("User selected Photo Library action")
    })
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style:
                .default, handler: { action in
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true,
                                 completion: nil)
            })
        
            alertController.addAction(cameraAction)
        }
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true,
                completion: nil)
        })
        alertController.addAction(photoLibraryAction)
    }
            
        alertController.addAction(cancelAction)
    
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picture.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        if !MFMailComposeViewController.canSendMail() {
            print("Can not send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["example@example.com"])
        mailComposer.setSubject("Look at this")
        mailComposer.setMessageBody("Hello, this is an email from the app I made.", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller:
        MFMailComposeViewController, didFinishWith result:
        MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
}

