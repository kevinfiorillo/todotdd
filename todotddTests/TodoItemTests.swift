//
//  todotddItemTests.swift
//  todotddTests
//
//  Created by kevin on 07/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//



import XCTest
@testable import todotdd

class TodoItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Init_WhenGivenTitle_SetsTitle(){
        let item = TodoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo","Should set title")
        

    }
    
    func test_Init_WhenGivenDescription_SetsDescription(){
        let item = TodoItem(title: "", itemDescription: "Bar" )
        XCTAssertEqual(item.itemDescription, "Bar","should set description")

    }
    
    func test_Init_SetsTimestamp() {
        let item = TodoItem(title: "",
        timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0,
        "should set timestamp")
    }
    
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = TodoItem(title: "", location: location)
        XCTAssertEqual(item.location?.name, location.name,"should set location"
        )
        
    }

}
