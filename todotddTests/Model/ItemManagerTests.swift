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
    
    func test_AddItem_IncreasesToDoCountToOne(){
        sut.add(TodoItem(title: ""))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_ItemAt_returnsAddedItem(){
        let item = TodoItem(title: "Foo")
        sut.add(item)
        
        let returnedItem = sut.item(at: 0)
        XCTAssertEqual(returnedItem.title, item.title)
        
    }
    
    func test_CheckItemAt_ChangesCount(){
        sut.add(TodoItem(title: ""))
        sut.checkItem(at:0)
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 1)
    }
    
    func test_CheckItemAt_RemovesItFromToDoItems(){
        let first = TodoItem(title: "first")
        let second = TodoItem(title: "second")
        sut.add(first)
        sut.add(second)
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.item(at: 0).title, "second")
    }
    
    func test_DoneItemAt_ReturnCheckedItem(){
        let item = TodoItem(title: "foo")
        sut.add(item)
        sut.checkItem(at: 0)
        let returnedItem = sut.doneItem(at: 0)
        
        XCTAssertEqual(returnedItem.title, item.title)
    }
    
    func test_RemoveAll_ResultsInCountsBeZero() {
        sut.add(TodoItem(title: "Foo"))
        sut.add(TodoItem(title: "Bar"))
        sut.checkItem(at: 0)
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        sut.removeAll()
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
        
    }
    
    func test_Add_WhenItemIsAlreadyAdded_DoesNotIncreaseCount() {
        sut.add(TodoItem(title: "Foo"))
        sut.add(TodoItem(title: "Foo"))
        XCTAssertEqual(sut.toDoCount, 1)
}

}
