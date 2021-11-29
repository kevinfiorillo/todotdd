//
//  ItemManager.swift
//  todotdd
//
//  Created by kevin on 11/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count}
    private var toDoItems: [TodoItem] = []
    private var doneItems: [TodoItem] = []
    
    func add(_ item: TodoItem){
        if !toDoItems.contains(item){
            toDoItems.append(item)
        }
    }
    
    func item(at index: Int) -> TodoItem{
        return toDoItems[index]
    }
    
    func checkItem(at index: Int){
        let itemRemoved = toDoItems.remove(at: index)
        doneItems.append(itemRemoved)
    }
    
    func doneItem(at index: Int) -> TodoItem{
        return doneItems[index]
    }
    
    func removeAll(){
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
