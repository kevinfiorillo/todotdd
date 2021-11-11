//
//  ItemManagerTests.swift
//  todotddTests
//
//  Created by kevin on 11/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import XCTest
@testable import todotdd

class ItemManagerTests: XCTestCase {
    
    var sut: ItemManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        sut = ItemManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_ToDoCount_initially_IsZero(){
    
        XCTAssertEqual(sut.toDoCount,0)
        
    }
    
    func test_DoneCount_Initially_isZero(){
        
        XCTAssertEqual(sut.doneCount,0)
    }
    

}
