//
//  TodoItem.swift
//  todotdd
//
//  Created by kevin on 07/11/2021.
//  Copyright © 2021 kevin_fiorillo. All rights reserved.
//

import Foundation


struct TodoItem: Equatable {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title:String, itemDescription:String? = nil, timestamp:Double? = nil, location: Location? = nil) {
       self.title = title
       self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
    if lhs.location != rhs.location {
        return false
    }
    if lhs.timestamp != rhs.timestamp {
        return false
    }
    if lhs.itemDescription != rhs.itemDescription {
        return false
        
    }
    if lhs.title != rhs.title {
        return false
        
    }
    return true
}
