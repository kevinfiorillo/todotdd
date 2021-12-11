//
//  ItemListViewControllerTests.swift
//  todotddTests
//
//  Created by kevin on 30/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import XCTest
@testable import todotdd

class ItemListViewControllerTests: XCTestCase {
    
    var sut: ItemListViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ItemListViewController")
        sut = (viewController as! ItemListViewController)
        sut.loadViewIfNeeded()
    }

    func test_TableViewIsNotNilAfterViewDidLoad(){
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource(){
        
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
        
    }
    
    func test_LoadingView_DataSourceEqualDelegate() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
        
    }

}
