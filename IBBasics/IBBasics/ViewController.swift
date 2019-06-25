//
//  ViewController.swift
//  IBBasics
//
//  Created by Erin Vincent on 2/7/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myButton.setTitleColor(.red, for: .normal)
    }

    @IBOutlet weak var myButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    
}

