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
    @IBOutlet weak var alarmTestButton: UIButton!
    var toggleIndex: Int?
    var testLocation = BikeLocation(title: "Test Location", coordinate: CLLocationCoordinate2D(latitude: 36.97720, longitude: -122.05368))
    var zoomSpan: MKCoordinateSpan?
    let lockIndexKey = "defaultLock"
    let unlockPrompt = "Unlock"
    let lockPrompt = "Lock"
    let testCoordinates = CLLocationCoordinate2D(latitude: 36.97720, longitude: -122.05368)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unlockButton.tintColor = UIColor.red
        unlockButton.setTitle(unlockPrompt, for: UIControl.State.normal)
        zoomSpan?.latitudeDelta = 500
        zoomSpan?.longitudeDelta = 500
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
        lockMapView.setCenter(testCoordinates, animated: true)
        let region = MKCoordinateRegion(center: testCoordinates, span: zoomSpan ?? MKCoordinateSpan(latitudeDelta: 250, longitudeDelta: 250))
        print(region)
    }
    
}

