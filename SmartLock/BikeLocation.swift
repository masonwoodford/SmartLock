//
//  BikeLocation.swift
//  SmartLock
//
//  Created by Mason Woodford on 2/6/22.
//

import MapKit

class BikeLocation : NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
      }
}
