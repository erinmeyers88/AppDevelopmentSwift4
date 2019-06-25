//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Erin Vincent on 3/15/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var toggle: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.addTarget(self, action: #selector(buttonTapped(_:)),
                         for: .touchUpInside)
    }

    
    
    @IBAction func respondToTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    @IBAction func buttonTapped(_ sender: Any) {
        print("button tapped")
        if (toggle.isOn) {
            print("switch is on")
        } else {
            print("switch is off")
        }
        print("the slider is set to \(slider.value)")
    }
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            print("switch is on")
        } else {
            print("switch is off")
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print("text changed to \(text)")
        }
    }
}

