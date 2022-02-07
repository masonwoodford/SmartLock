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

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultLockToggle.selectedSegmentIndex = defaults.integer(forKey: "defaultLock")
    }
    
    @IBAction func toggleDefaultLock(_ sender: Any) {
        if defaults.integer(forKey: "defaultLock") == 0 {
            defaults.set(1, forKey: "defaultLock")
            defaultLockToggle.selectedSegmentIndex = 1
        } else {
            defaults.set(0, forKey: "defaultLock")
            defaultLockToggle.selectedSegmentIndex = 0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        defaults.synchronize()
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
