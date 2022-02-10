//
//  BikeLocation.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/6/22.
//

import MapKit

class BikeLocation : NSObject, MKAnnotation {
    var title: String?
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? = "Bike Location"

    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
      }
    
    func setTitle(title: String) {
        self.title = title
    }
}
