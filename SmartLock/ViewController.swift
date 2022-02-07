//
//  ViewController.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var lockToggle: UISegmentedControl!
    var toggleIndex = UserDefaults.standard.integer(forKey: "defaultLock")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unlockButton.tintColor = UIColor.red
        unlockButton.setTitle("Unlock", for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lockToggle.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "defaultLock")
        toggleIndex = UserDefaults.standard.integer(forKey: "defaultLock")
    }
    
    @IBAction func toggleLockStatus(_ sender: Any) {
        if unlockButton.tintColor == UIColor.green {
            unlockButton.tintColor = UIColor.red
        } else {
            unlockButton.tintColor = UIColor.green
        }
        if unlockButton.title(for: UIControl.State.normal) == "Unlock" {
            unlockButton.setTitle("Lock", for: UIControl.State.normal)
        } else {
            unlockButton.setTitle("Unlock", for: UIControl.State.normal)
        }
    }
    
    @IBAction func toggleLock(_ sender: Any) {
        if toggleIndex == 0 {
            lockToggle.selectedSegmentIndex = 1
            toggleIndex = 1
        } else {
            lockToggle.selectedSegmentIndex = 0
            toggleIndex = 0
        }
    }
    
}

