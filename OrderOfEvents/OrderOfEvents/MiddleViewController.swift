//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Erin Vincent on 5/30/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabel(lifeCycle: "viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var middleViewLabel: UILabel!
    
    var eventNumber: Int = 1
    
    func updateLabel(lifeCycle: String) {
        if let existingText = middleViewLabel.text {
            middleViewLabel.text = "\(existingText) \nEvent number \(eventNumber) was \(lifeCycle)"
        }
        eventNumber += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(lifeCycle: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateLabel(lifeCycle: "viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateLabel(lifeCycle: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        updateLabel(lifeCycle: "viewDidDisappear")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
