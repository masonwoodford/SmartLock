//
//  ViewController.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/5/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var unlockButton: UIButton!
    @IBOutlet weak var lockToggle: UISegmentedControl!
    @IBOutlet weak var lockMapView: MKMapView!
    @IBOutlet weak var locateButton: UIButton!
    var toggleIndex: Int?
    var testLocation = BikeLocation(title: "Test Location", coordinate: CLLocationCoordinate2D(latitude: 36.988100, longitude: 122.058200))
    let lockIndexKey = "defaultLock"
    let unlockPrompt = "Unlock"
    let lockPrompt = "Lock"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unlockButton.tintColor = UIColor.red
        unlockButton.setTitle(unlockPrompt, for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        toggleIndex = UserDefaults.standard.integer(forKey: lockIndexKey)
        lockToggle.selectedSegmentIndex = toggleIndex ?? 0
    }
    
    @IBAction func toggleLockStatus(_ sender: Any) {
        if unlockButton.tintColor == UIColor.green {
            unlockButton.tintColor = UIColor.red
        } else {
            unlockButton.tintColor = UIColor.green
        }
        if unlockButton.title(for: UIControl.State.normal) == unlockPrompt {
            unlockButton.setTitle(lockPrompt, for: UIControl.State.normal)
        } else {
            unlockButton.setTitle(unlockPrompt, for: UIControl.State.normal)
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
    
    @IBAction func locateLock(_ sender: Any) {
        lockMapView.addAnnotation(testLocation)
    }
    
}

