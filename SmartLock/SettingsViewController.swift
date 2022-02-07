//
//  SettingsViewController.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/5/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultLockToggle: UISegmentedControl!
    let defaults = UserDefaults.standard
    let lockIndexKey = "defaultLock"
    var defaultLockIndex: Int {
        return defaults.integer(forKey: lockIndexKey)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultLockToggle.selectedSegmentIndex = defaultLockIndex
    }
    
    @IBAction func toggleDefaultLock(_ sender: Any) {
        if defaultLockIndex == 0 {
            defaults.set(1, forKey: lockIndexKey)
            defaultLockToggle.selectedSegmentIndex = 1
        } else {
            defaults.set(0, forKey: lockIndexKey)
            defaultLockToggle.selectedSegmentIndex = 0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        defaults.synchronize()
    }

}
