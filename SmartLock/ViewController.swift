//
//  ViewController.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var lockControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unlockButton.tintColor = UIColor.red
        unlockButton.setTitle("Unlock", for: UIControl.State.normal)
    }
    
    @IBAction func toggleLock(_ sender: Any) {
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
    

}

