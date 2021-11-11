//
//  Location.swift
//  todotdd
//
//  Created by kevin on 08/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name:String,coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
