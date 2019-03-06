//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Chidi Emeh on 3/2/19.
//  Copyright © 2019 Chidi Emeh. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    //Function name pattern
    //test_<method name>_<precondition>_<expected behavior>
    
    func test_Init_WhenGivesDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set itemDescription")
    }

    func test_Init_TakesTitleAndDescription() {
        let todoItem = ToDoItem(title: "Foo", itemDescription: "Bar")
        XCTAssertNotNil(todoItem.title, "title should be set")
        XCTAssertNotNil(todoItem.itemDescription, "itemDescription should be set")
    }
    
    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }
    
    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "Foo", location: location)
        XCTAssertEqual(item.location, location, "should set location")
    }
    
    func test_EqualItems_AreEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        XCTAssertEqual(first, second)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenOneLocationIsNilAneTheOtherIsnt_AreNotEqual() {
        var first = ToDoItem(title: "", location: Location(name: "Foo"))
        var second = ToDoItem(title: "", location: nil)
        
        second = ToDoItem(title: "", location: Location(name: "Foo"))
        first = ToDoItem(title: "", location: nil)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTimestampsDiffers_AreNotEqual() {
        let first = ToDoItem(title: "Foo", timestamp: 1.0)
        let second = ToDoItem(title: "Foo", timestamp: 0.0)
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenDescriptionDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTitlesDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Bar")
        
        XCTAssertNotEqual(first, second)
    }
    
}
