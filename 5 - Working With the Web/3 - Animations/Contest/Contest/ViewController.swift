//
//  ViewController.swift
//  Contest
//
//  Created by Erin Vincent on 8/2/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print(emailTextField?.text)
        if (emailTextField.text == "") {
            UIView.animate(withDuration: 2, animations: {
                self.emailTextField.transform = CGAffineTransform(translationX: 50, y: 2)
            }) { (_) in
                self.emailTextField.transform = CGAffineTransform.identity
                
            }
        } else {
              performSegue(withIdentifier: "success", sender: self)
        }
    }
    
    
}

