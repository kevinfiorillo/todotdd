//
//  ItemListDataProviderTests.swift
//  todotddTests
//
//  Created by kevin on 07/12/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import XCTest
@testable import todotdd

class ItemListDataProviderTests: XCTestCase {
    
    var controller: ItemListViewController!
    var sut: ItemListDataProvider!
    var tableView: UITableView!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    override func setUp() {
        super.setUp()
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = (storyboard.instantiateViewController( withIdentifier: "ItemListViewController") as! ItemListViewController)
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        tableView.dataSource = sut
    }

    func test_NumberOfSections_IsTwo() {
       
        
        
        
        
        
        
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func test_NumberOfRows_InFirstSection_IsToDoCount(){
        
       
        
       
        
        sut.itemManager?.add(TodoItem(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.add(TodoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumberOfRows_Section2_IsToDoneCount() {
        
        
       
        
        sut.itemManager?.add(TodoItem(title: "Foo"))
        sut.itemManager?.add(TodoItem(title: "Bar"))
        sut.itemManager?.checkItem(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
        
    }
    
    func test_CellForRow_ReturnsItemCell() {
        
               
        
        
        sut.itemManager?.add(TodoItem(title: "Foo"))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
        
    }
    func test_CellForRow_DequeuesCellFromTableView() {
        
        
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        sut.itemManager?.add(TodoItem(title:"Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row:0, section:0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func test_CellForRow_CallsConfigCell(){
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        let item = TodoItem(title: "Foo")
        sut.itemManager?.add(item)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        XCTAssertTrue(cell.configCellGotCalled)
    }
        
}

extension ItemListDataProviderTests{
    class MockTableView: UITableView{
        var cellGotDequeued = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell{
        var configCellGotCalled = false
        
        override func configCell(with item: TodoItem){
            configCellGotCalled = true
        }
    }
}
