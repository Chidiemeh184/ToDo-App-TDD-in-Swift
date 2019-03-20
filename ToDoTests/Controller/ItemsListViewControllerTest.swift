//
//  ItemsListViewControllerTest.swift
//  ToDoTests
//
//  Created by Chidi Emeh on 3/11/19.
//  Copyright © 2019 Chidi Emeh. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemsListViewControllerTest: XCTestCase {

    var sut: ItemListViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as? ItemListViewController
        _ = sut.view
    }

    override func tearDown() {
        
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut?.tableView)
    }
    
    func test_LoadingView_SetsTableViewDatasource() {
        XCTAssertTrue(sut?.tableView?.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsDatasourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }

}
