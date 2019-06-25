//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by Erin Vincent on 6/19/19.
//  Copyright © 2019 Erin Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var didFinishLaunchingCount = 0
    var willResignActiveCount = 0
    var didEnterBackgroundCount = 0
    var willEnterForegroundCount = 0
    var didBecomeActiveCount = 0
    var willTerminateCount = 0
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(didFinishLaunchingCount) time(s)."
        willResignActiveLabel.text = "The app has resigned active \(willResignActiveCount) times(s)."
        didEnterBackgroundLabel.text = "The app has entered background \(didEnterBackgroundCount) times(s)."
        willEnterForegroundLabel.text = "The app has entered the foreground \(willEnterForegroundCount) time(s)."
        willTerminateLabel.text = "The app has terminated \(willTerminateCount) times(s)."
    }
}

