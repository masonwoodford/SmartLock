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
    let lockIndexKey = "defaultLock"
    let unlockPrompt = "Unlock"
    let lockPrompt = "Lock"
    let zoomSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    let testCoordinates = CLLocationCoordinate2D(latitude: 36.97720, longitude: -122.05368)
    
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
        resetMap()
        if toggleIndex == 0 {
            lockToggle.selectedSegmentIndex = 1
            toggleIndex = 1
        } else {
            lockToggle.selectedSegmentIndex = 0
            toggleIndex = 0
        }
    }
    
    func resetMap() {
        lockMapView.removeAnnotation(testLocation)
        lockMapView.setRegion(MKCoordinateRegion(.world), animated: true)
    }
    
    @IBAction func locateLock(_ sender: Any) {
        if lockToggle.selectedSegmentIndex == 1 {
            testLocation.setTitle(title: "Lock 2")
        } else {
            testLocation.setTitle(title: "Lock 1")
        }
        lockMapView.addAnnotation(testLocation)
        lockMapView.setRegion(MKCoordinateRegion(center: testCoordinates, span: zoomSpan), animated: true)
    }
    
}

