//
//  LocationTests.swift
//  todotddTests
//
//  Created by kevin on 08/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import XCTest
@testable import todotdd
import CoreLocation

class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1,
        longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func test_Init_SetsName(){
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name,"Foo")
    }

}
