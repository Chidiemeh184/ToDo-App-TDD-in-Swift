//
//  ItemManager.swift
//  ToDo
//
//  Created by Chidi Emeh on 3/5/19.
//  Copyright © 2019 Chidi Emeh. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItem.count }
    private var toDoItems: [ToDoItem] = []
    private var doneItem: [ToDoItem] = []
    
    func add(_ item: ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItem.append(item)
    }
    
    func uncheckItem(at index: Int) {
        let item = doneItem.remove(at: index)
        toDoItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItem[index]
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItem.removeAll()
    }
}
