//
//  ViewController.swift
//  Login
//
//  Created by Erin Vincent on 5/24/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var ForgotUserName: UIButton!
    @IBOutlet weak var ForgotPassword: UIButton!
    
    @IBAction func forgotUserNameTapped(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: ForgotUserName)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        performSegue(withIdentifier: "LogInSegue", sender: ForgotPassword)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? UIButton else {return}
        
        if sender == ForgotPassword {
             segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == ForgotUserName {
            segue.destination.navigationItem.title = "Forgot User Name"
        } else {
            segue.destination.navigationItem.title = UserName.text
        }
        
        
    }


}

